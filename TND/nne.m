function [e] = untitled(appr, test)
test_labels_pred = knn_pred(appr, test);
nlabcmp(getlab(test), test_labels_pred);
end

