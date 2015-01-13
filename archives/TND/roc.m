function [ TFP_ET_TVP ] = roc (D, C) % (D)ataset, (C)lassifier

% r√©cup√©rer les labels pr√©dis du classifier
tic;
classifierLabs = labeld(D, C(D)); 
time = toc;
% r√©cup√©rer la comparaison des labels du dataset 
labelsD = getlab(D);

% r√©cup√©rer nombre de classes
nb_c = getsize(D, 3);
classes = getlablist(D);

% recuperer le nombre de lignes
nb_l = getsize(D, 1);

% infos a trouver
VP = 0;
FP = 0;
VN = 0;
FN = 0;

% pour chaque classe
for c = 1 : nb_c
    % on recupere le label de la classe positive
    positive = classes(c, :);
    % pour chaque ligne
    for l = 1 : nb_l
       vrai = labelsD(l, :);
       predit = classifierLabs(l, :);
       % si c'est la classe positive vraie
       if isequal(positive, vrai)
           % si on a prÈit la classe positive
          if isequal(vrai, predit)
            VP = VP +1;
            % si on a pas prÈdit la classe positive
          else
              FN = FN + 1;
          end
       % si c'est la classe nÈgative vraie
       else
        % si on a prÈdit la classe positive
        if isequal(positive, predit)
            FP = FP + 1;
        % si on a pas prÈdit la classe negative
        else
            VN = VN + 1;
        end
       end
    end
end

TVP = VP / (VP + FN);
TFP = FP / (FP + VN);

TFP_ET_TVP = [TFP TVP time];

end