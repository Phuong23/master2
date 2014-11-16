% fonction qui importe les données, les mélange, et les place dans un
% dataset grâce au numéro de colonne des labels
irisSet = importData('iris.data', 5);
irisConf = conf(irisSet)

wineSet = importData('Wine.data', 14);
wineConf = conf(wineSet)

glassSet = importData('Glass.data', 11);
% c'est très très lent donc on le met en commentaire
% glassConf = conf(glassSet)

cancerSet = importData('Cancer.data', 31);
% cancerConf = conf(cancerSet)

irisSet = setlablist(irisSet, char('a', 'b', 'c'));
fish = correct(irisSet, fisherc, 'd');
% visualiser l'erreur (on a défini un seul type d'erreur pour faire simple,
% mais on aurait pu aller plus loin en étant plus précis)
%scatterd(fish, 'gridded')

%scatterd(correct(irisSet, qdc, 'd'), 'gridded');
%scatterd(correct(irisSet, udc, 'd'), 'gridded');
%scatterd(correct(irisSet, ldc, 'd'), 'gridded');
%scatterd(correct(irisSet, nmc, 'd'), 'gridded');
%scatterd(correct(irisSet, parzenc, 'd'), 'gridded');
%scatterd(correct(irisSet, knnc, 'd'), 'gridded');
%scatterd(correct(irisSet, treec, 'd'), 'gridded');
%scatterd(correct(irisSet, svc, 'd'), 'gridded');
% bug : scatterd(correct(irisSet, lmnc, 'd'), 'gridded');

% il y a des classifieurs qui obtiennent de meilleurs resultats en
% particulier treec, parzenc, qdc, svc, udc, ldc, et d'autres moins bon,
% comme fisherc, nmc ...


% g�nerer l'espace roc
rocSet = dataset([
roc(irisSet, fisherc);
roc(irisSet, qdc);
roc(irisSet, udc);
roc(irisSet, ldc);
roc(irisSet, parzenc);
roc(irisSet, knnc);
roc(irisSet, treec);
roc(irisSet, svc);
roc(irisSet, lmnc)
], char('fisherc', 'qdc', 'udc', 'ldc', 'parzenc', 'knnc', 'treec', 'svc', 'lmnc'));
rocSet = setfeatlab(rocSet, char('TFP', 'TVP', 'time'));
% afficher roc
scatterd(rocSet, 'legend');
% afficher temps
+rocSet(:, 3)
% le meilleur semble �tre treec

wineRoc = applyroc(wineSet);
glassRoc = applyroc(glassSet);
cancerRoc = applyroc(cancerSet);
scatterd(cancerRoc, 'legend');
% je remarque que certains classifieurs sont mauvais dans certains datasets
% alors qu'ils �taient performants dans d'autres. Je remarque que treec est
% en permanence le meilleur.