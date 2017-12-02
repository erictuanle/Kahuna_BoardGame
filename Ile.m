%============================================================
% DEFINITION DE CLASSE : ILE
% -------------------------------
%
% Les objets de la classe sont les Iles du plateau
%
%============================================================

classdef Ile
    % ILe : Description de la classe :
    %   Iles du plateau
    
    properties
        % les attributs de la classe
        nom          % le nom de l'objet
        % RECOPIER LE MEME NOM QUE LE NOM DE LA VARIABLE OBJET
        % dans les hashmap : impossible de mettre un objet en value, on ne peut mettre qu'un string/char
        % on remonte Ã  l'objet avec eval(nom_obj)
        id
        ponts        % HashMap des ponts de l'ile
        % key = nom de l'ile voisine (type : String)
        % value = pont (type : Objet pont)
        nbPonts      % Nombre de ponts de l'ile
        % Pas besoin d'une hashset car la boucle for est definie comme suit :
        % Syntax :
        %     for index = values
        %         program statements
        %         :
        %     end
        % Description
        % values has one of the following forms:
        % * initval:endval -> increments the index variable from initval to endval by 1,
        %                     and repeats execution of program statements until index is greater than endval.
        % *initval:step:endval -> increments index by the value step on each iteration,
        %                         or decrements when step is negative.
        % *valArray -> creates a column vector index from subsequent columns of array valArray on each iteration.
        %             For example, on the first iteration, index = valArray(:,1). The loop executes for a maximum
        %             of n times, where n is the number of columns of valArray, given by numel(valArray, 1, :).
        %             The input valArray can be of any MATLAB data type, including a string, cell array, or struct.
        %=========================================================================================================
        possession   % peut prendre la valeur 0 ou contenir le **NOM** du joueur qui la possede (type char)
        cartes       % HashMap des cartes correspondant a l'ile :
        % key = 1 ou 2 (chiffre apres le nom de l'ile dans le nom de la carte)
        % Values = objets cartes
        coordx       %coordonnées selon x du centre de l'ile
        coordy       %coordonnées selon y du centre de l'ile
        
        
    end
    
    
    
    methods
        % CONSTRUCTEUR
        function self = Ile(nom, id, nbPonts,coordx,coordy)
            self.nom = nom ;
            self.possession = 0;
            self.id = id;
            self.nbPonts = nbPonts ;
            self.ponts = java.util.HashMap ;
            self.cartes = java.util.HashMap ;
            self.coordx=coordx;
            self.coordy=coordy;
        end
        
        % /!\ Dans le script de creation des cartes, penser a rajouter ile.cartes = carteEnQuestion
        
        function addPont(ile, nom_pont)
            ile.ponts.put(size(ile.ponts)+1,nom_pont);
        end
        
        % /!\ Dans le script de creation des ponts, penser a rajouter addPont(ile,pontEnQuestion)
        
        
        %------------------------------------------------------
        % METHODES
        
        % Verification : 'joueur' possede-t'il plus de la moitiÃ© des ponts ?
        function boolPossess = possedee(ile, nom_joueur)
            run globalization
            joueur = eval(nom_joueur);
            nbPossession = 0 ; %nb de ponts possedes par 'joueur'
            cellPont = valuesHashm(ile.ponts);
            s = size(cellPont);
            for i=1:s(1)
                pont = eval(cellPont{i});
                if (mod(T_possesspont(pont.id,2),2) == mod(tour,2) && not(T_possesspont(pont.id,2)==0))
                    nbPossession = nbPossession + 1;
                end
            end
            clear cellPont k s
            % Condition de controle d'une ile : posseder plus de la moitie des ponts
            if (nbPossession >= floor((ile.nbPonts)/2)+1)
                boolPossess = 1;
            else
                boolPossess = 0;
            end
        end
        
        
        
        % verification du controle d'une ile par le joueur 'joueur'
        function controle(ile, nom_joueur)
            run globalization
            joueur = eval(nom_joueur) ;
            if (possedee(ile,nomJoueur)==1)
                T_possessile(ile.id,2) = joueur.id ;
                % AFFICHAGE DE LA POSSESSION SUR LA MAP (PION..)
                % destruction des ponts adverses :
                cellPont = valuesHashm(ile.ponts);
                s2 = size(cellPont);
                for j = 1:s2(1)
                    pont = eval(cellPont{j});
                    autreJoueur=eval(joueur.nomAutreJoueur);
                    if(T_possesspont(pont.id,2)==autreJoueur.id)
                        destroy(pont);
                        
                        % la destruction d'un pont peut faire perdre le controle de l'autre ile adjacente:
                        cellIle = valuesHashm(pont.ilesAdjacentes);
                        s3 = size(cellIle);
                        for k=1:s3(1)
                            ileAdj =cellIle{k};
                            if (not(ileAdj == ile.nom)) % on ne va pas recontroler 'ile'...
                                ileAdj = eval(ileAdj) ; % on obtient l'objet Ã  partir du nom
                                if ((T_possessile(ileAdj.id,2) == autreJoueur.id)&&(possedee(ileAdj,joueur.nomAutreJoueur))==0)
                                    T_possessile(ileAdj.id,2)= 0;
                                end
                            end
                        end
                        clear cellIle s3 k
                    end
                    clear autreJoueur
                end
                clear cellPont s2 j
            else
                T_possessile(ile.id,2) = 0 ;
            end  
        end      
    end
end

