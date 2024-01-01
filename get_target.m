function target = get_target(img,gt)
% Get the target signal
[x,y] = size(gt);
gt = reshape(gt,x*y,1);
targetLoc = gt == 1;
targetSamples = img(targetLoc,:);
target = mean(targetSamples); 

end

