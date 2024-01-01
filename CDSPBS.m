%{ 
    Reference: X. Sun, H. Zhang, Y. Zhu, F. Xu and X. Fu "Constrained-Target Band
               Selection With Subspace Partition for Hyperspectral Target Detection,”
               IEEE Journal of Selected Topics in Applied Earth Observations and 
               Remote Sensing (IEEE JSTARS), DOI: 10.1109/JSTARS.2021.3109455.

    Input:     img: normalized data set with size N * L, 
               K: number of the selected bands
               target: target signature
               method_Name: Two versions of the method are provided, 
                            'CDSP_MinV' and 'CDSP_MaxV' 
                   
    Output:    band_Set: an optimal subset of bands
%}
function [band_Set] = CDSPBS(img,target,method_Name,K)
K = K+1;
[~,L] = size(img);
CD_Matrix = 1 - abs(corrcoef(img));%correlation distance matrix
P = SP(CD_Matrix, L, K);%

if strcmp(method_Name,'CDSP_MinV')
    disp('Using CDSP_MinV method...');
    loc_V = MinVBP(img,target');
    else if strcmp(method_Name,'CDSP_MaxV')
        disp('Using CDSP_MaxV method...');
        loc_V = MaxVBP(img,target');
    end
end

rank = flipud(loc_V);
A = zeros(K-1,L);
for i = 1 : K - 1
    for j = P(i) : P(i+1)-1
        A(i,j) = find(rank == j);
    end
end
A(i,L) = find(rank == L);
[ ~ ,band_Set]=max(A,[],2);
disp(['optimal subset of bands:',newline,num2str(band_Set')]);
end
