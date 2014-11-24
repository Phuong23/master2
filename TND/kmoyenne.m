function [ labels ] = kmoyenne ( data, nb_cluster )
    
    % recuperer infos
    [nb_lignes, nb_cols] = size(data);
    prototypes = zeros(nb_cluster, nb_cols);
    prototypes_new = prototypes;
    labels = zeros(nb_lignes, 1);
 
    if nb_cluster > nb_lignes
       throw(MException('kmoyenne:truc', 'nombre de cluster ne peut être supérieur au nombre de lignes'))
       dataset()
    else
        
         % prendre les premieres lignes parce que elle est deja melangee
        for i = 1 : nb_cluster
            prototypes(i, :) = data(i, :);
            labels(i) = i;
        end
        
        prototypes

        % fonctionnement de pdist2 :

        % pdist2([1 2; 1 3; 1 4], [1 2])
        % 0
        % 1
        % 3

        % pdist2([1 2; 1 3; 1 4], [1 2; 1 3])
        % 0     1
        % 1     0
        % 2     3

        % pdist2([1 2; 1 3; 1 4], [1 2; 1 3; 1 4])
        % 0     1     2
        % 1     0     1
        % 2     1     0

        continuer = true;
        while continuer

            % distance avec les barycentres
            distances = pdist2(prototypes, data);

            % attribuer le barycentre le plus proche de chaque donnée
            for i = 1 : nb_lignes
                distances(:, i);
                [~, index] = min(distances(:, i));
                labels(i) = index;
            end

            % calculer les nouveaux barycentres
            for c = 1 : nb_cluster

                sum_data_cluster = zeros(1, nb_cols);
                nb_data_cluster = 0;

                for l = 1 : nb_lignes
                    % si la donnée est dans le cluster
                    if isequal(labels(l), c)
                        % ajouter à la somme
                        sum_data_cluster = sum_data_cluster + data(l, :);
                        nb_data_cluster  = nb_data_cluster + 1;
                    end
                end

                % calculer la moyenne
                prototypes_new(c, :) = sum_data_cluster / nb_data_cluster;
            end

            % si ce sont les mêmes que les précédents on arrête
            if isequal(prototypes, prototypes_new) 
                continuer = false;
            else
                % sinon on remplace
                prototypes = prototypes_new;
            end
        end

        dataset(data, labels)
    end
    
end

