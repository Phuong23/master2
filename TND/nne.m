function [e] = nne (appr, test)
% si les deux bases sont identiques
if (isequal(appr, test)) 
    % on récupère la taille
    [l, c] = size(appr);
    % on stocke les labels
    trueLabels = getlab(appr);
    e = l; % nombre d'erreurs
    % pour chaque ligne (index i)
    for i = 1:1:l
        % on stocke tout sauf la ligne à l'index i dans appr
        loo_appr = [appr(1:i-1, :) ; appr(i+1:l, :)];
        % on stocke la ligne i dans test
        loo_test = appr(i, :);
        % on récupère la prédiction du label de loo_test
        label = knn_pred(loo_appr, loo_test);
        % on compare avec le vrai label grâce à l'index
        if (isequal(trueLabels(i, :) , label))
            e = e - 1; % pas d'erreur
        end
    end
    e = e / l; % normaliser l'erreur
else
    test_labels_pred = knn_pred(appr, test);
    % on compare les différences
    e = nlabcmp(getlab(test), test_labels_pred) / size(test, 1);
    % on retourne
end
[e];
end

