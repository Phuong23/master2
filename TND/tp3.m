% charger la base
iris = load('iris.data');
% size(iris) donne la taille de iris
% size(iris, 1) donne le nombre de ligne de iris
% randperm(n) donne une permutation aléatoire des entiers de 1 à n
% iris (x, y) donne les données lignes -> x et colonnes -> y
% donc iris (randperm(150), :) donne une permutation des lignes de iris
randIris = iris( randperm(size(iris, 1)), :);
% on fait un dataset avec la permutation de iris
irisSet = dataset(randIris(:, 1:4), randIris(:, 5));
% lablist remplace les noms des classes
irisSet.lablist = char('setosa', 'versicolor', 'virginica');
% on coupe
appr = irisSet(1:100, :);
test = irisSet(101:150, :);
% créer une fonction avec New -> Function
lab_pred = knn_pred(appr, test);
nne(appr, test)