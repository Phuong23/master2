irisSet = importData('iris.data', 5);
getlab(irisSet)
getfeat(irisSet) % c'est vide car on a pas donne de noms
irisSet = setfeatlab(irisSet, char('A', 'B', 'C', 'D'));
getfeat(irisSet) % maintenant ça marche
a = seldat(irisSet, 3);
+a
% ça marche !
data = rand([6 4]);
% on ajoute
a = dataset([a ; data], [ getlab(a) ; [1;1;1;2;2;2] ] );
a
a = [a rand([56 1]) ]; % on ajoute une variable random
+a

a = setfeatlab(a, char('A', 'B', 'C', 'D', 'E'));

scatterd(a, 3, 'legend');
%scatterd([a(:, 2) a(:, 5)], 'legend');