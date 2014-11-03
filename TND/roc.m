function [ ] = roc (D, C) % (D)ataset, (C)lassifier

% récupérer les labels prédis du classifier
classifierLabs = labeld(D, C(D)); 
% récupérer la comparaison des labels du dataset 
labelsD = getlab(D);

% récupérer nombre de classes
nb_c = getsize(D, 3);
classes = getlablist(D);

% récupérer le nombre de lignes
nb_l = getsize(D, 1);

% infos à trouver
VP = 0;
FP = 0;
VN = 0;
FN = 0;

% pour chaque classe
for c = 1 : nb_c
    % on récupère le label
    lab_c = classes(c, :);
    % pour chaque ligne
    for l = 1 : nb_l
       vrai = labelsD(l, :);
       predit = classifierLabs(l, :);
       % si c'est la classe positive, et si la prédiction est vraie
       if isequals(c, predit) && isequals(vrai, predit) 
          VP = VP + 1; % vrai positif
       % si c'est la classe positive, et si la prédiction est fausse
       elseif isequals(c, predit) && not(isequals(vrai, predit))
           
       end
    end
end

end