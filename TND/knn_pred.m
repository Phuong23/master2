% fonction [sortie] = nom (entrée)
function [lab_pred] = knn_pred(appr, test)
    % on instancie une matrice vide
    lab_pred = [];
    [n, k] = size(test);
    % distm calcule le carré de la distance euclidienne entre appr et test
    % min de ça donne le plus petit de chaque colonne
    % m la valeur, j le numéro de ligne ce qui permet d'identifier
    % l'élement dans appr.
    [~, j] = min(distm(appr, test));
    % on récupère les labels de appr
    labels = getlab(appr);
    % pour chaque ligne (élément) de test
    for i = 1:1:n
        % on ajoute à lab_pred :
        % j c'est les numéros de ligne des plus proches voisins
        % j(i) c'est le i ème élément de j (le i ème plus proche voisin)
        % labels(j(i), :) c'est le label du i ème plus proche voisin
        lab_pred = [lab_pred; labels(j(i), :)];
        % on construit la liste des labels dans l'ordre donné par j
    end
    [lab_pred]'; % transformer en colonne
end

