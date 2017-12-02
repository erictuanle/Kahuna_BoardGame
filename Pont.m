%============================================================
% DEFINITION DE CLASSE : PONT
% -------------------------------
%
%
%============================================================

classdef Pont
    % PONT : Description de la classe :
    %   Pont Ã  poser entre les iles
    
    properties
        % les attributs de la classe
        id             % l'identifiant du pont (entier entre 1 et 24)
        nom          % le nom de l'objet
        % RECOPIER LE MEME NOM QUE LE NOM DE LA VARIABLE OBJET
        % dans les hashmap : impossible de mettre un objet en value, on ne peut mettre qu'un string/char
        % on remonte Ã  l'objet avec eval(nom_obj)
        ilesAdjacentes % HashMap des iles adjacentes (key = 1 ou 2, value = objet Ile)
        coord1x         % coordonnee d'une extremite du pont selon x
        coord1y         % coordonnee d'une extremite du pont selon y
        coord2x         % coordonnee de l'autre extremite du pont selon x
        coord2y         % coordonnee de l'autre extremite du pont selon y
        possession      % **NOM** du joueur (type : CHAR) qui possede le pont ou 'null' si le pont n'est pas construit
        % zone cliquable
    end
    
    methods
        % Constucteur
        function self = Pont(nom, id, ilesAdjacentes, coord1x, coord1y, coord2x, coord2y)
            self.nom = nom ;
            self.id = id ;
            self.ilesAdjacentes = ilesAdjacentes ;
            self.coord1x = coord1x;
            self.coord1y = coord1y;
            self.coord2x = coord2x;
            self.coord2y = coord2y;
            self.possession = 0;
        end
        
        % Methodes d'interface graphique et de jeu
        
        % Construction d'un pont par le joueur 'joueur' = jeu d'une carte
        % methode declenchee par
        % 1) le clic sur la carte 'carte' du joueur
        % 2) le clic sur le pont a construire
        
        function build(pont,nom_carte)
            run globalization
            nom_joueur=nomJoueur;
            carte = eval(nom_carte) ;
            joueur = eval(nom_joueur);
            ok=0;
            %Préparation aux arnaques
            cellIlesAdj=valuesHashm(pont.ilesAdjacentes);
            s=size(cellIlesAdj);
            for i=1:s(1)
                ile = eval(cellIlesAdj{i});
                cellCartes=valuesHashm(ile.cartes);
                s2=size(cellCartes);
                for j=1:s2(1)
                    carteTest = eval(cellCartes{j});
                    if (nom_carte == carteTest.nom)
                        ok=1;
                    end;
                    disp(cellCartes{j})
                end
                clear cellCartes s2 j
            end
            clear cellIlesAdj s i
            % on pare aux bugs..
            if(not(joueur.cartes.containsValue(nom_carte)))
                disp ('tentative de jouer une carte n appartenant pas au joueur');
                T_possesspont(pont.id,2)=0;
            elseif (ok==0)
                disp ('tentative de jouer une carte ne correspondant pas au pont');
                T_possesspont(pont.id,2)=0;
            else
                % on construit le pont selectionne
                if (nom_joueur=='joueur1')
                    T_possesspont(pont.id,2)=1;
                    
                else
                    T_possesspont(pont.id,2)=2;
                end
                
               % on verifie que ce changement de possession n'a pas change le controle des iles adjacentes
                cellIlesVois = valuesHashm(pont.ilesAdjacentes);
                s3 = size(cellIlesVois) ;
                for i = 1:s3(1)
                    ileVois = eval(cellIlesVois{i});  % on prend l'objet a partir du nom
                    controle(ileVois,nomJoueur);
                end
                clear cellIlesVois s3 i
                % on defausse la carte
                defausser(carte,nom_joueur);
                % AFFICHAGE sur le plateau
                %set(handles(2+pont),'LineWidth',5,'Color',[0 0 0]);
                % activation de la ligne entre coord1 et coord2 avec epaisseur suffisante
            end
        end
        
        % destruction d'un pont :
        % declenchee par le clic sur un pont ennemi
        function detruire(pont,nom_carte1,nom_carte2,nom_joueur)
            run globalization
            carte1 = eval(nom_carte1);
            carte2 = eval(nom_carte2);
            joueur = eval(nom_joueur);
            % on verifie que les cartes permettent de dÃ©truire le pont
            ok = 0;
            cellIlesAdj = valuesHashm(pont.ilesAdjacentes);
            s = size(cellIlesAdj);
            for i = 1:s(1)
                ile = eval(cellIlesAdj{i});
                cellCartes = valuesHashm(ile.cartes);
                s2 = size(cellCartes);
                for j=1:s2(1)
                    carteTest = eval(cellCartes{j});
                    if (nom_carte1 == carteTest.nom)
                        ok = ok + 1;
                    end
                    if (nom_carte2 == carteTest.nom)
                        ok = ok + 1;
                    end
                end
                clear cellCartes j s2                          
            end
            clear cellIlesAdj s i
            if (not(ok==2))
                disp('Ces cartes ne permettent pas de detruire ce pont')
            elseif (nom_carte1==nom_carte2)
                sprintf(' Si on ne peut plus tricher avec ses amis, ce nest plus la peine de jouer aux cartes. - Marcel Pagnol \n Et non, pas cette fois...mais bien essayé!')
            else
                % on détruit le pont
                destroy(pont);
                % on verifie que ce changement de possession n'a pas change le controle des iles adjacentes
                cellIlesVois = valuesHashm(pont.ilesAdjacentes);
                s3 = size(cellIlesVois) ;
                for i = 1:s3(1)
                    ileVois = eval(cellIlesVois{i});  % on prend l'objet a partir du nom
                    controle(ileVois,nomJoueur);
                end
                clear cellIlesVois s3 i
                % on defausse les cartes jouees
                defausser(carte1,nom_joueur)
                defausser(carte2,nom_joueur)
            end
        end
        
        % Destruction d'un pont
        function destroy(pont)
            run globalization
            T_possesspont(pont.id,2) = 0 ;
        end
    end
    
    
end

