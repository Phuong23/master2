function [mat] = knn_labs( appr, test )
mat = [];
for i = 1:1:size(test)
   [m, j] = min(distm(appr, test(i)));
   labels = getlab(appr);
   mat = [mat; labels(j)];
end
[mat];
end