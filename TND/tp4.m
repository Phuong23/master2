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