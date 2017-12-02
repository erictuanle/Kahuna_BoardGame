%============================================================
% DEFINITION DE FONCTION : keys
% -------------------------------
% 
% Prend en argument une hashmap et renvoie l'ensemble des key
% sous forme de vecteur 1 ligne x n colonnes
%
% Evite de ressaisir ce qui suit à chaque fois, dans un souci
% de lisibilité et d'efficacité
%
% ARGUMENT : une hashmap
%
%============================================================

function keys = keys(hashmap)
	keys = transpose(cell2mat(hashmap.keySet.toArray.cell));
end