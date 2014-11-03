function [ D2 ] = correct( D, C, L ) % Dataset M et Classifier C et Nom de labels pour les Incorrects
% r�cup�rer les labels pr�dis du classifier
classifierLabs = labeld(D, C(D));
% r�cup�rer la comparaison des labels du dataset 
labelsD = getlab(D);
[~, correctLabs] = nlabcmp(labelsD, classifierLabs);
s = getsize(D, 1);
newLabs = labelsD;
for i = 1:1:getsize(D, 1)
    if correctLabs(i, :) == 1
        newLabs(i, :) = labelsD(i, :);
    else
        newLabs(i, :) = L;
    end
end
D2 = dataset(D, newLabs);
[D2];
end

