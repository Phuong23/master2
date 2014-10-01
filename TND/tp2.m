iris = load('iris.data');
data = iris(:, 1:4);
labels = iris(:, 5);
a = dataset(data,labels);
class1 = seldat(a, 1);
class2 = seldat(a, 2);
class3 = seldat(a, 3);
% Commande suivante inutile pour tp
labels = genlab([length(class1) length(class2) length(class3)], char('setosa', 'versicolor', 'virginica'));
% fin
a = setlablist(a, char('setosa', 'versicolor', 'virginica'));
