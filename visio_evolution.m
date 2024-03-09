clear all ;

%% Charger les donnees depuis les fichiers
maillage_evol = dlmread('historique_M.txt') ;
front_evol = dlmread('historique_F.txt') ;

it=1

% Parcourir la matrice maillage_evol
for i = it:size(data, 1)
    sommets = [];
    triangles=[];
    % Vérifier si la première lettre de la première colonne est "S"
    if maillage_evol(i, 1) == 'S'
        % Ajouter les valeurs des colonnes 2 et 3 à donnees_filtrees
        sommets = [sommets; data(i, 2:3)];
    elseif maillage_evol(i, 1) == 'T'
        triangles = [triangles; data(i, 2:4)];
    elif maillage_evol(i, 1) == 'F'
        it=i+1; %pour reprendre la prochaine fois à partir du 'F'
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%Visualisation
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        triplot(triangles(:, [1 2 3]), sommets(:, 1), sommets(:, 2), 'k') ;
        scatter(sommets(:, 1), sommets(:, 2), 'r') ;
        xlabel('X') ;
        h = ylabel('Y') ;
        set(h, 'Rotation', 0); %Rotation du label de l'axe des ordonnées
        title('Maillage') ;
        axis equal ;
        axis tight;
        break;
    end
end

% Parcourir la matrice front_evol
it=0
for i = it:size(front_evol, 1)
    sommets = [];
    % Vérifier si la première lettre de la première colonne est "F"
    if front_evol(i, 1) == 'F'
        it=i+1; %pour reprendre la prochaine fois à partir du 'F'
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%Visualisation
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        hold on;
        scatter(sommets(:, 1), sommets(:, 2), 'b');
    else
        sommets = [sommets; data(i, 2:3)];
    end
end