% Changement du joueurCourant
nomJoueurTmp = nomJoueurCourant;
joueurTmp = eval(nomJoueurTmp) ;
nomJoueurCourant = joueurTmp.nomAutreJoueur ;
action=0;
tourEnCours=[cellstr('0'),cellstr('0'),cellstr('0')];
clear joueurTmp nomJoueurTmp

%% Test
% run Generation
% joueur = joueur2;
% joueur
% for i=1:5
%     i
%     nomJoueurTmp = joueur.nom;
%     joueurTmp = eval(nomJoueurTmp)
%     class(joueurTmp)
%     class(joueur)
%     joueur = eval(joueurTmp.nomAutreJoueur)
%     class(joueur)
%     clear joueurTmp
%     joueur
% end
