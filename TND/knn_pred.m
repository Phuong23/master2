function [lab_pred] = knn_pred(appr, test)
    lab_pred = [];
    [n, k] = size(test);
    [m, j] = min(distm(appr, test));
    labels = getlab(appr);
    for i = 1:1:n
        lab_pred = [lab_pred; labels(j(i), :)];
    end
    [lab_pred]';
end

