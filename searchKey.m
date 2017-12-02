%============================================================
% DEFINITION DE FONCTION : searchKey
% ----------------------------------
% 
% Prend en argument une hashmap et une value et renvoie une key
% telle que sa value soit 'value'
%
% Evite de ressaisir ce qui suit à chaque fois, dans un souci
% de lisibilité et d'efficacité
%
% ARGUMENT : une hashmap : 'mapObj'
%		   : une value :  'value'
%
%============================================================

function key = searchKey(mapObj, value)
	for k = keys(mapObj)
      if mapObj.get(k) == value
          key = k;
          break
       end
    end
end