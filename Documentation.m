%% Utilisation générale de Java en matlab
  % se référer au bouquin undocumented matlab
  % pour connaître les méthodes associées à un type java :
  %   methods(java.util.Stack)    pour les piles par exemple
 
  % ATTENTION : obj2=obj1 ne copie pas l'objet 1 dans l'objet 2 !!
  % copie seulement la référence comme en java...
  % Il faut recréer un objet obj2 en recopiant obj1 dedans par constructeur par exemple

  %% Parcours de éléments d'une HashSet
    % Avec un itérateur = objet initialisé " dans le vide, avant le premier élement", et qui
    % parcourt la liste/la hashset par élément suivant avec la méthode '.next()'
    % La méthode .hasNext() vérifie la présence d'un élément suivant, et permet donc le parcours
    % ou simplement d'éviter l'erreur "pas d'élement suivant"
    % Exemple :
    %     x = (java.util.HashSet);
    %     x.add(1);
    %     x.add(2);
    %     it=x.iterator()
    %     while(it.hasNext())
    %         it.next()
    %     end

 %%Utilisation des HashMap
  % /!\ JAMAIS D'OBJET EN VALUE D'UNE HASHMAP !!  Matlab ne les reconnaitra pas
  % On met le nom de l'objet entre quotes ('nom_obj') et on accède à l'objet avec
  % la fonction eval : eval('nom_obj')
  %% En Matlab : java.util.HashMap 
   % Syntaxe : mapObj = java.util.HashMap;
   %           mapObj.put(key,value);
   %             Exemple:
   %                          keySet=[1, 2]
   %                          valueSet=[2, 4]
   %                          siz=size(keySet) % size(keySet) renvoie 1,  2
   %                          s=siz(2) 
   %                          x = java.util.HashMap;
   %                          for i = 1:s
   %                              x.put(keySet(i),valueSet(i));
   %                          end
   %                      RENVOIE :
   %                              keySet =
   %                                   1     2
   %                              valueSet =
   %                                   2     4
   %                              siz =
   %                                   1     2
   %                              s =
   %                                   2
   %                              x =
   %                              {2.0=4.0, 1.0=2.0}
   % Méthodes :
    % FONCTIONS PERSO : cf keys et values
    % ----------------------------------------------------------------------------------------------
    % get
    % obtenir la valeur d'une clé
    % mapObj.get(key) -> RENVOIE value
    % ----------------------------------------------------------------------------------------------
    %  containsKey : Determine if java.util.HashMap object contains key
    %     tf = containsKey(mapObj,keySet) looks for the specified keys in mapObj,
    %       and returns logical true (1) for the keys that it finds,
    %       and logical false (0) for those it does not.
    %     Input :
    %       keySet : Scalar value, string, or cell array that specifies keys to find in mapObj.
    %     Output :
    %       tf : Array of logical values.
    %       If keySet is a scalar or a string, tf is a scalar.
    %       Otherwise, tf has the same size and dimensions as keySet.
    %  ----------------------------------------------------------------------------------------------
    %  keySet :
    %     PASSER PAR keys(mapObj)
                                                                                          %     Identify keys of java.util.HashMap object
                                                                                          %     Syntax
                                                                                          %       keys = keySet(mapObj) returns cell array keySet, which contains all of the keys in mapObj.
                                                                                          %     Output
                                                                                          %       keys: 1-by-n cell array, where n is the number of keys in mapObj.
    %  ----------------------------------------------------------------------------------------------
    %  remove : Remove key-value pairs from java.util.HashMap object
    %         : input : key -> mapObj.remove(key)
    %  ----------------------------------------------------------------------------------------------
    %  values :
    %     PASSER PAR values(mapObj)
                                                                                          %   Identify values in java.util.HashMap object
                                                                                          %   Syntax :
                                                                                          %     valueSet = values(mapObj) returns all of the values in mapObj
                                                                                          %     valueSet = values(mapObj,keySet) returns values that correspond to the specified keys
                                                                                          %   Output :
                                                                                          %     valueSet : Cell array containing values from mapObj. If you specify keySet, the valueSet array has the same size and dimensions as keySet
    %  ----------------------------------------------------------------------------------------------
    %   containsValue
    %  ----------------------------------------------------------------------------------------------
    % trouver la key 'key' d'une value 'value' dans une hashmap 'map' :
    % for key = map.keySet
    %   if map(key)==value
    %       k = key;
    %       break
    %   end
    % end
    % et la key est 'k'
                      
    % NE PAS UTILISER                                                                     % En Matlab : containers.Map
                                                                                          % Utilisation : Map values to unique keys
                                                                                          % Syntaxe : mapObj = containers.Map(myKeys,myValues);
                                                                                          %           mapObj(key) = value % définit ou redéfinit la valeur de key à value


                                                                                          % Méthodes :
                                                                                          % ----------------------------------------------------------------------------------------------
                                                                                          %  isKey : Determine if containers.Map object contains key
                                                                                          %     tf = isKey(mapObj,keySet) looks for the specified keys in mapObj,
                                                                                          %       and returns logical true (1) for the keys that it finds,
                                                                                          %       and logical false (0) for those it does not.
                                                                                          %     Input :
                                                                                          %       keySet : Scalar value, string, or cell array that specifies keys to find in mapObj.
                                                                                          %     Output :
                                                                                          %       tf : Array of logical values.
                                                                                          %       If keySet is a scalar or a string, tf is a scalar.
                                                                                          %       Otherwise, tf has the same size and dimensions as keySet.
                                                                                          %     Examples
                                                                                          %       Construct a map that contains rainfall data for several months:
                                                                                          %         months =   {'Jan', 'Feb', 'Mar', 'Apr'};
                                                                                          %         rainfall = [327.2, 368.2, 197.6, 178.4];
                                                                                          %         mapObj = containers.Map(months,rainfall);
                                                                                          %       Determine if keys Apr, May, and Jun are in the map:
                                                                                          %         keySet = {'Apr','May','Jun'};
                                                                                          %         tf = isKey(mapObj,keySet)
                                                                                          %           This code returns 1-by-3 vector tf:
                                                                                          %           tf =
                                                                                          %           1     0     0
                                                                                          %       Determine if mapObj from the previous example contains key Feb:
                                                                                          %         keySet = 'Feb';
                                                                                          %         tf = isKey(mapObj,keySet)
                                                                                          %           This code returns scalar tf:
                                                                                          %           tf =
                                                                                          %           1
                                                                                          %  ----------------------------------------------------------------------------------------------
                                                                                          %  keys : Identify keys of containers.Map object
                                                                                          %     Syntax
                                                                                          %       keySet = keys(mapObj) returns cell array keySet, which contains all of the keys in mapObj.
                                                                                          %     Output
                                                                                          %       keySet: 1-by-n cell array, where n is the number of keys in mapObj.
                                                                                          %  ----------------------------------------------------------------------------------------------
                                                                                          %  remove : Remove key-value pairs from containers.Map object
                                                                                          %  ----------------------------------------------------------------------------------------------
                                                                                          %  values :
                                                                                          %   Identify values in containers.Map object
                                                                                          %   Syntax :
                                                                                          %     valueSet = values(mapObj) returns all of the values in mapObj
                                                                                          %     valueSet = values(mapObj,keySet) returns values that correspond to the specified keys
                                                                                          %   Output :
                                                                                          %     valueSet : Cell array containing values from mapObj. If you specify keySet, the valueSet array has the same size and dimensions as keySet       




                                                                                          %  Exemples avec containers.Map % (structure légèrement différente, pas les mêmes méthodes)
                                                                                          %   Création : keys = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', ...
                                                                                          %     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Annual'};
                                                                                          %  
                                                                                          %   values = {327.2, 368.2, 197.6, 178.4, 100.0,  69.9, ...
                                                                                          %     32.3,  37.3,  19.0,  37.0,  73.2, 110.9, 1551.0};
                                                                                          % 
                                                                                          %   rainfallMap = containers.Map(keys, values)
                                                                                          %
                                                                                          %   Lookup: x = rainfallMap('Jan');
                                                                                          % 
                                                                                          %   Assign: rainfallMap('Jan') = 0;
                                                                                          % 
                                                                                          %   Add: rainfallMap('Total') = 999;
                                                                                          % 
                                                                                          %   Remove: rainfallMap.remove('Total')


%% Utilisation des Stacks
            % Empty Stack:

            % |     |
            % |     |
            % |     |
            % -------
            % After Pushing A, you get:

            % |     |
            % |     |
            % |  A  |
            % -------
            % After Pushing B, you get:

            % |     |
            % |  B  |
            % |  A  |
            % -------
            % After Popping, you get:

            % |     |
            % |     |
            % |  A  |
            % -------
            % After Pushing C, you get:

            % |     |
            % |  C  |
            % |  A  |
            % -------
            % After Popping, you get:

            % |     |
            % |     |
            % |  A  |
            % -------
            % After Popping, you get:

            % |     |
            % |     |
            % |     |
            % -------


            % =====================================

            % push(p) push(o) push(p) push(c) push(o) push(r) push(n)

            % after pushing the entire word, the stack looks like:

            %    |  n   |  <- top
            %    |  r   |
            %    |  o   |
            %    |  c   |
            %    |  p   |
            %    |  o   |
            %    |  p   |  <- bottom (first "thing" pushed on an empty stack)
            %     ======
            % when I pop() seven times, I get the letters in this order:
            % n,r,o,c,p,o,p

            % =======================================

            % >> a = java.util.Stack;
            % >> a.push(1);
            % >> a.pop()
            % ans =
            %      1
            % >> a.push(1);
            % >> x=a.pop();
            % >> x
            % x =
            %      1
            % >> a.size()


            % =======================================

            % donc pour insérer une carte carteDefaussee en bas de la pile pioche :
            % %(on suppose la pioche déjà constituée et de type java.util.Stack)
            % tempStack = java.util.Stack;
            % % on renverse la pile pioche
            % for i=1:pioche.size()
            %   tempStack.push(pioche.pop());
            % end
            % % on insère la carteDefaussee en bas et on refait la pile
            % pioche.push(carteDefaussee);
            % for i=1:tempStack.size()
            %   pioche.push(tempStack.pop());
            % end

            % % % Pour s'en convaincre :
            % % pioche = java.util.Stack;
            % % for i=1:4
            % %   pioche.push(i);
            % % end

            % % pioche2 = pioche ;
            % % carteDefaussee = 5;

            % % for i=1:pioche2.size()
            % %   pioche2.pop()
            % % end

            % % tempStack = java.util.Stack;
            % % for i=1:pioche.size()
            % %   tempStack.push(pioche.pop());
            % % end
            % % % on insère la carteDefaussee en bas et on refait la pile
            % % pioche.push(carteDefaussee);
            % % for i=1:tempStack.size()
            % %   pioche.push(tempStack.pop());
            % % end
            % % for i=1:pioche.size()
            % %   pioche.pop()
            % % end


    % % Utilisation des queues
    %     type ArrayDeque : à la fois FIFO (first in first out) et FILO (first in last out)
    %      => peut servir à la fois de pile et de queue
        
    %     Exemple
    %         x = java.util.ArrayDeque;
    %         x.addFirst(1);
    %         x.addFirst(2);
    %         x.addFirst(3);
    %         x
    %         -> x = [3.0, 2.0, 1.0]
    %         x.pollFirst() % après addFirst -> comportement FILO : Pile
    %         -> ans = 3
    %         x.addFirst(3);
    %         x.pollLast() % après addFirst -> comportement FIFO : Queue
    %         -> ans = 1
    %         x.addLast(1);
    %         x
    %         -> x = [3.0, 2.0, 1.0]
         

    %% Portée des variables

        % Variables globales
            % Declare global variablesexpand all in page
            % Syntax
            % global X Y Z

            % Description

            % global X Y Z defines X, Y, and Z as global in scope.
        
        % The following information should help you understand how to use global variables and MATLAB workspaces.

        % MATLAB Workspaces

        % *************************

        % In order to understand global variables, you must first understand variables as they are normally stored in MATLAB.

        % All variables in MATLAB are stored in a workspace. When manipulating data at the command line, the variables are stored in the MATLAB base workspace. The contents of this workspace can be displayed by using the whos command.

        % MATLAB functions have their own workspaces, separate from the MATLAB workspace. Variables defined in this function workspace are automatically cleared from memory when the function returns.

        % MATLAB script files store all variables in the calling workspace. If a MATLAB script is called from the command line, the variables are stored in the base workspace. If the same script is called from a function, the script stores its variables in the function's workspace, and the variables are cleared when the function returns.

        % There is also a third type of workspace, the global workspace, where all global variables are stored. The contents of this workspace can be seen by using the whos global command. You cannot work directly in the global workspace, but variables in another workspace can be declared global using the GLOBAL command.

        % Creating Global Variables

        % ****************************

        % Global variables are created using the global command. When the command

        %         global my_x
        % is issued, the following process occurs:

        % 1. If a variable called my_x exists in the global workspace, then its value is assigned to the local workspace's variable my_x. Any existing local variable my_x has its value overwritten.

        % 2. If no variable called my_x exists in the global workspace, but there is a variable my_x in the current workspace, then the local variable my_x is placed in the global workspace.

        % 3. If no variable exists in either the current workspace or the global workspace, then a new variable my_x is created and given the value [] (the empty matrix). This new variable is placed in the global workspace.

        % 4. The local variable and the global variable are then linked.

        % Note that there is opportunity for confusion here. Suppose you want a function MyFun to share a global variable, my_x, with the main MATLAB workspace, where it has a value. If you declare my_x global in MyFun first, then the global value for my_x becomes [], the empty matrix. If you then declare my_x global in the main MATLAB workspace, this empty matrix overwrites the local value for my_x, and its initial value is lost. Declaring the variable global in the main MATLAB workspace first, and then in MyFun, does the right thing -- the initial value for my_x is retained. Care must be taken to avoid this kind of mistake.

        % Tips for Working with the Global Workspace

        % ***************************************************

        % Use care when naming global variables. Since all functions use the same global workspace, naming conflicts can easily occur. To avoid this, use unique, descriptive variable names for all global variables. Since variable names are case sensitive, capitalization can also be used to keep global variable names unique. For example, instead of using x, use Selected_X_Coord.

        % The commands CLEAR, WHO, and WHOS normally apply to the current workspace. These commands take an optional argument, global, which specifies that the command should be applied to the global workspace. For example, to show the contents of the global workspace, type at the MATLAB prompt:

        %     whos global
        % Clearing a variable from the local workspace (using 'clear my_x') breaks the link between the local and global variables, but does not erase the global variable.

        % Clearing a variable from the global workspace (using 'clear global my_x') completely erases the variable my_x from the local and global workspaces.

        % The ISGLOBAL function can be used to determine if a link exists between a local variable and the global workspace. This function does not determine if a variable exists in the global workspace; if the variable exists in the global workspace, but no link exists from a local variable, ISGLOBAL returns a zero (false).

        % The command PACK clears all variables from the global workspace. After PACK is issued, the global workspace is empty, and no variables have links to the global workspace. Therefore, take care when using the PACK command to re-declare variables as global after making the call to PACK.

        % Relevant commands: clear, global, isglobal, who, whos, pack
 
 




% Boucles FOR :
%  The following loop sums up all elements in a list. The return value of the loop is the final sum. It can be assigned to a variable:
% s := 0: S := for x in [c, 1, d, 2] do s := s + x end_for
% S := {c, d, 1}
% for x in S do print(x) end_for:


