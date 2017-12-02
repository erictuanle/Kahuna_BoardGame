%============================================================
% DEFINITION DE FONCTION : valuesHashm
% -------------------------------
% 
% Prend en argument une hashmap et renvoie l'ensemble des values
% sous forme de vecteur n lignes x 1 colonne
%
% Evite de ressaisir ce qui suit a chaque fois, dans un souci
% de lisibilite et d'efficacite
%
% ARGUMENT : une hashmap
%
%============================================================

function values = valuesHashm(hashmap)
	values = hashmap.values.toArray.cell;
end