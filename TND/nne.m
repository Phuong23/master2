function [e] = nne (appr, test)
test_labels_pred = knn_pred(appr, test);
% on compare les différences
e = nlabcmp(getlab(test), test_labels_pred);
% on retourne
[e];
end

