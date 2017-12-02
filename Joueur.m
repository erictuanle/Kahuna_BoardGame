
%============================================================
% DEFINITION DE CLASSE : JOUEUR
% -------------------------------
%
%
%============================================================

classdef Joueur
    % Joueur : Description de la classe :
    %   Joueur/utilisateur du programmme
    
    properties
        % les attributs de la classe
        id                      % l'identifiant du joueur : 1 ou 2
        nom          % le nom de l'objet
        % RECOPIER LE MEME NOM QUE LE NOM DE LA VARIABLE OBJET
        % dans les hashmap : impossible de mettre un objet en value, on ne peut mettre qu'un string/char
        % on remonte à l'objet avec eval(nom_obj)
        iles                    % HashSet des iles possedees
        cartes                  % HashMap des cartes possedees (cartes en main)
        % key = 1,.. ou 5 et values = nom cartes
        nomAutreJoueur             % l'autre joueur (objet de type joueur)
        points                  % nombre de points du joueur
    end
    
    methods
        % Constucteur
        function self = Joueur(nom,id)
            % on ne met pas autreJoueur dans le constructeur car au moment de creer le premier joueur l'autre joueur n'existe pas encore
            self.nom = nom ;
            self.id = id ;
            self.iles = java.util.HashSet ; % a la creation du joueur il ne possede aucune ile
            self.cartes = java.util.HashMap ; % a la creation du joueur il ne possede aucune carte
            self.points=0;
        end
        
        
        % Verification du tour
        function bool = tourCourant(joueur)
            % CONVENTION : le joueur 1 commence -> tour 1 et tours impairs
            if (mod(tour,2) == mod(joueur.id,2))
                bool = 1;
            else
                bool = 0;
            end
        end
        
        % controle du nombre de cartes en main # A executer a la fin de chaque tour
        function controleNbCartes(joueur)
            run globalization
            if (joueur.cartes.size == 5)
                disp('Vous avez deja  5 cartes, vous ne pouvez pas piocher');
            end
            if (joueur.cartes.size > 5)
                disp('Vous avez trop de cartes, vous allez etre defaussee des cartes excedentaires')
                for i = 1:(joueur.cartes.size-5)
                    joueur.cartes.remove(i+5);
                end
            end
        end
        
        % FONCTION DE PIOCHAGE DANS LA PIOCHE
        % -----------------------------------
        % Prerequis : Cette fonction permet de piocher ** 1 ** carte dans la pioche
        %             Cliquer sur la pioche appellera cette fonction pour le joueur
        %             qui a clique (le joueur dont c'est le tour)
        %           : pioche : la pioche du jeu, de type java.util.Stack
        function piocher_pioche(joueur)
            run globalization
            if (joueur.cartes.size == 5)
                disp('Vous avez deja  5 cartes, vous ne pouvez pas piocher');
            elseif (joueur.cartes.size > 5)
                disp('Vous avez trop de cartes, vous allez etre depossede(e) des cartes excedentaires')
                for i = 1:(joueur.cartes.size-5)
                    joueur.cartes.remove(i+5);
                end
            else
                carte = pioche.pop();
                joueur.cartes.put(joueur.cartes.size+1,carte);
            end
            
        end
        
        function piocher_troiscartes(joueur,nom_carte)
            run globalization
            if (joueur.cartes.size == 5)
                disp('Vous avez deja  5 cartes, vous ne pouvez pas piocher');
            elseif (joueur.cartes.size > 5)
                disp('Vous avez trop de cartes, vous allez etre depossede(e) des cartes excedentaires')
                for i = 1:(joueur.cartes.size-5)
                    joueur.cartes.remove(i+5);
                end
            else
                joueur.cartes.put(joueur.cartes.size+1,nom_carte);
                cartesDecouvertes.remove(numHandles-35);
                k=numHandles-35;
                s=3;
                if (k<s)
                    for i=k+1:s
                        cartesDecouvertes.put(i-1,cartesDecouvertes.get(i));
                        cartesDecouvertes.remove(i)
                    end
                end
                if (pioche.size>0)
                    carte=pioche.pop();
                    cartesDecouvertes.put(3,carte);
                    clear carte
                else
                    finManche=1;
                end
            end
        end
        
    end
    
end

