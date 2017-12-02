%============================================================
% DEFINITION DE FONCTION : containsValue
% ----------------------------------
% 
% Prend en argument une hashmap et une value et renvoie un booléen
% selon que la hashmap contient 'value' ou non
%
% Evite de ressaisir ce qui suit à chaque fois, dans un souci
% de lisibilite et d'efficacite
%
% ARGUMENT : une hashmap : 'mapObj'
%		   : une value :  'value'
%
%============================================================

function bool containsValue(mapObj,value)
    cellValues = valuesHashm(mapObj);
    s = size(cellValues);
	for i = 1:s(1)
		if cellValues{i} == value
			bool = 1 ;
			break ;
		end
	end
	bool = 0 ;
end