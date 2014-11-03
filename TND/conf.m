function [ C ] = conf( data )
    % recupère le nombre de classe de la base des donnees
    nb_class = getsize(data, 3);
    % on calcule le nombre de paires
    % nb_paires = factorial(nb_class) / (factorial(2) * factorial(nb_class - 2));
    % mais en fait ca sert a rien
    % générer une matrice de taille nb_paires x nb_paires
    C = zeros(nb_class, nb_class);
    % comparer chaque classe deux a deux
    for i = 1:1:nb_class
        for j = 1:1:nb_class
            temp_data = seldat(data, [i j]); % selectionner deux classes
            C(i, j) = size(temp_data, 1) - size(temp_data, 1) * nne(temp_data, temp_data); % leave one out avec knn
        end
    end
    [C];
end

