%============================================================
% SCRIPT DE LANCEMENT DE PREMIERE
% -------------------------------
% Prerequis : Appelee par la fonction principale JeuKahuna()
% Arguments : Aucun
%============================================================

%Set des cartes des joueurs : attribut de la classe joueur

%Set des trois cartes face dÃ©couvert :
cartesDecouvertes = java.util.HashMap;

%Set des cartes défaussées
cartesDefaussees = java.util.ArrayDeque;
    % méthode pour défausser une carte =  méthode de la classe carte


% Set des cartes de la pile face caché = Pioche
pioche = java.util.Stack ;

%Distribution des cartes
cartes=[]; % on crée un tableau vide qui contiendra les indices des cartes
r = randperm(24); % r est une permutation numerique
for i=1:24
    cartes=[cartes,r(i)]; % on concatène r(i) au tableau carte -> "pile" de cartes mélangées
end
% Rappel : pour acceder au nom d'une carte a partir de son id :
% Tcorrile(id_2,2) pr acceder a la case 2 qui stocke le nom
joueur1.cartes.put(1,char(T_corrcarte(cartes(1),2)));
joueur1.cartes.put(2,char(T_corrcarte(cartes(2),2)));
joueur1.cartes.put(3,char(T_corrcarte(cartes(3),2)));
joueur2.cartes.put(1,char(T_corrcarte(cartes(4),2)));
joueur2.cartes.put(2,char(T_corrcarte(cartes(5),2)));
joueur2.cartes.put(3,char(T_corrcarte(cartes(6),2)));

cartesDecouvertes.put(1,char(T_corrcarte(cartes(7),2)));
cartesDecouvertes.put(2,char(T_corrcarte(cartes(8),2)));
cartesDecouvertes.put(3,char(T_corrcarte(cartes(9),2)));

for i=10:24
    pioche.push(char(T_corrcarte(cartes(i),2)));
end

% Nettoyage des variables temporaires et inutiles ensuite
clear r cartes i

%Variable globale stockant le numero du tour
tour = 1;

