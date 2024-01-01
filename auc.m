function [auc] = auc(re,GT)
num = sum(GT(:));len = numel(GT);
[row,col] = size(GT);
Map = normalize(abs(re));
[x] = sort(reshape(Map,row*col,1))';
S = length(x);
rePD = zeros(1,S); rePF = zeros(1,S);
   for j = 1:S
       t = x(j);
       if j == S  % 
            M = (Map>t);
        else
            M = (Map>=t);
       end
        rePF(j) = sum((GT(:)==0)&(M(:)==1))/(len-num);
        rePD(j) = sum((GT(:)==1)&(M(:)==1))/num;
   end
temp1 = rePD(1:end-1) + rePD(2:end);
temp2 = abs(diff(rePF));
auc = sum(temp1.*temp2)/2;
disp(['aucpdpf: ',num2str(auc)]);
end

    
