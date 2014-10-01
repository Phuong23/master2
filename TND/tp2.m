% exercice 1
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
a.featlab = char('a', 'b', 'c', 'd');
scatterd(a,'gridded')
plotf(a) % Les meilleures features pour identifier les classes sont la c et la d
b = a(:, 3:4);
scatterd(b)

% exercice 2
distmaha(a)
distmaha(b)
% comment savoir la meilleure paire sans essayer toutes les
% combinaisons ?

% exercice 3
x1 = rand(50,1) * 2
y1 = rand(50,1) * 2 - 1
x2 = rand(50,1) * 4 - 1
x2 = rand(50,1) * 2 + 1
y2 = rand(50,1) * 2 + 1.5
d2d = dataset([[x1;x2] [y1;y2]], genlab([50 50], char('class1', 'class2')))
d2d.featlab = char('area', 'perimeter')
scatterd(d2d)

% exercice 4
bana1 = gendatb([10 10])
bana1k = gendatk(bana1, [100 100])
bana1p = gendatp(bana1, [100 100])
bana2 = gendatb([100, 100])
scatterd(bana1k)
scatterd(bana1p)
scatterd(bana2)
% la meilleure génération est gendatb mais gendatp s'en approche.
% la génération de gendatk est mauvaise, elle forme des lignes.

% excercice 5
g = gauss(100)
p = parzenm(g)
ooo = [-2 : 0.1 : 2]';
d = map(ooo, p)
figure; plot(+ooo, +d)
figure;plot(+ooo, +map(ooo, knnm(g)))

