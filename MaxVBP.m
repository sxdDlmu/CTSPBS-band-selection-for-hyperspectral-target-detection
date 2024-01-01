function loc = MaxVBP( img,d)
% MaxV-BP 
[~,L] = size(img);
vb = zeros(L,1);
for l = 1:L
    dl = d';
    dl(l)=[];
    Ml = img';
    Ml(l,:) = [];
    vb(l) = variance(Ml,dl);
end
[~,loc]=sort(vb,1,'descend');  
end

