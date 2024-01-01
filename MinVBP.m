function loc = MinVBP( img,d )
% MinV-BP 
[~,L] = size(img);
vb = zeros(L,1);
for l = 1:L
    dl = d(l);
    Ml = img(:,l); 
    vb(l) = variance(Ml',dl); 
end
[~,loc]=sort(vb,1,'ascend');  
end

