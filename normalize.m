function [value] = normalize(map)
% normalized
maxx=max(map(:));
minn=min(map(:));
value=(map-minn)/(maxx-minn);     
end