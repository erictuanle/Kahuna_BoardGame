%============================================================
% DEFINITION DE CLASSE : CARTE
% -------------------------------
%
% Les objets de la classe sont les cartes à jouer
%
% Definir une classe permet de rassembler les attributs et simplifier
% le travail par la suite, notamment sur l'interface graphique
%
% CONVENTION : nom des objets cartes : on les nommera par 'le nom de l'ile' + 1 ou 2
%
%
%============================================================

classdef Carte
    % CARTE : Description de la classe :
    %   Cartes � jouer
    %
    %   CONVENTION : nom des objets cartes : on les nommera par 'le nom de l'ile' + 1 ou 2
    
    properties (SetAccess = public)
        % les attributs de la classe
        nom          % le nom de l'objet
                        % RECOPIER LE MEME NOM QUE LE NOM DE LA VARIABLE OBJET
                        % dans les hashmap : impossible de mettre un objet en value, on ne peut mettre qu'un string/char
                        % on remonte à l'objet avec eval(nom_obj)
        id    % l'identifiant de la carte (entier entre 1 et 24) : utile pour le tri aleatoire de la pile par exple
        ile   % le nom de l'ile associee
        img   % l'image de la carte dans l'interface graphique (img car 'image' est un mot-cle matlab)
    end
    
    methods
        % Constucteur
        function self = Carte(nom, id, ile, img)
            self.nom = nom ;
            self.id = id ;
            self.ile = ile ;
            self.img = img ;
        end
        
        % verification que 'joueur' possede cette carte
        function bool = possedee(carte,nom_joueur)
            run globalization
            joueur = eval(nom_joueur);
        	% Attention, les values sont de type string/char (on ne peut pas stocker d'objet)
            bool = containsValue(joueur.cartes,carte.nom);
        end
        
        
        % Defausser la carte
        % prerequis: cartes defaussees stockees dans une queue (FIFO)
        %            appelee cartesDefaussees
        function defausser(carte,nom_joueur)
            run globalization
            joueur = eval(nom_joueur);
            cartesDefaussees.addFirst(carte.nom);
            % se referer à la documentation section Queues
            k = searchKey(joueur.cartes,carte.nom);
            joueur.cartes.remove(k);
            siz = size(keys(joueur.cartes)); %renvoie un tableau 1x2 (comme si taille de matrice)
            s = siz(2)+1; % taille effective
            if (k<s)
                for i=k+1:s
                    joueur.cartes.put(i-1,joueur.cartes.get(i));
                    joueur.cartes.remove(i) ;
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%AFFICHAGE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
        end
        
        % % Defausser la carte au fond de la pioche
        %     % (pioche est de type java.util.Stack)
        %     function defausser(pioche)
        %         run globalization
        %         % on retourne la pile
        %         tempStack = java.util.Stack;
        %         for i=1:pioche.size()
        %           tempStack.push(pioche.pop());
        %         end
        %         % on insere la carteDefaussee en bas et on refait la pile
        %         pioche.push(this);
        %         for i=1:tempStack.size()
        %           pioche.push(tempStack.pop());
        %         end
        %     end
    end
    
    
    
end

