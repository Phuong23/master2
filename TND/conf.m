function [ C ] = conf( data )
    % recupère le nombre de classe de la base des donnees
    nb_class = getsize(data, 3);
    % on calcule le nombre de paires
    % nb_paires = factorial(nb_class) / (factorial(2) * factorial(nb_class - 2));
    % mais en fait �a sert � rien
    % générer une matrice de taille nb_paires x nb_paires
    C = zeros(nb_class, nb_class);
    % comparer chaque classe deux � deux
    for i = 1:1:nb_class
        for j = i+1:1:nb_class
            temp_data = seldat(data, [i j]); % s�lectionner deux classes
            C(i, j) = nne(temp_data, temp_data); % leave one out avec knn
            C(j, i) = C(i, j); % sym�trie
        end
    end
    [C];
end

