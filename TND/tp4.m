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
scatterd(fish, 'gridded')

scatterd(correct(irisSet, qdc, 'd'), 'gridded');
scatterd(correct(irisSet, udc, 'd'), 'gridded');
scatterd(correct(irisSet, ldc, 'd'), 'gridded');
scatterd(correct(irisSet, nmc, 'd'), 'gridded');
scatterd(correct(irisSet, parzenc, 'd'), 'gridded');
scatterd(correct(irisSet, knnc, 'd'), 'gridded');
scatterd(correct(irisSet, treec, 'd'), 'gridded');
scatterd(correct(irisSet, svc, 'd'), 'gridded');
% bug : scatterd(correct(irisSet, lmnc, 'd'), 'gridded');

% il y a des classifieurs qui obtiennent de meilleurs résultats en
% particulier treec, parzenc, qdc, svc, udc, ldc, et d'autres moins bon,
% comme fisherc, nmc ...
 