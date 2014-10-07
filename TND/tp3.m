iris = load('iris.data');
randIris = iris( randperm(size(iris, 1)), :);
irisSet = dataset(randIris(:, 1:4), randIris(:, 5));
irisSet.lablist = char('setosa', 'versicolor', 'virginica');
appr = irisSet(1:75, :);
test = irisSet(76:150, :);