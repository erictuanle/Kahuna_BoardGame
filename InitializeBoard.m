%*************************************************************************

function InitializeBoard()
% Creates the game board and graphics handles

% /!\ Il faut avoir lancé Generation et globalization avant cette fonction

% on liste les variables globales utilisees
run globalization
action=0;
% Voir annexe explicative
%   Détermine l’action dans les callback
%       Valeur = 0 :
%       -   Valeur par défaut
%       -   Valeur réaffectée en fin de tour
%       -   Si on clique sur une carte quand ‘action = 0’, elle est défaussée
%       Valeur = 1
%           Construire un pont
%       Valeur = 2
%           Détruire un pont

tourEnCours=[cellstr('0'),cellstr('0'),cellstr('0')];
run scriptManche1 %Pour débuter la manche

%Fenêtres
handles(1) = figure('units','normalized','outerposition',[0 0 1 1]);
set(handles(1),'Name','KAHUNA');
set(handles(1),'Toolbar','none');
set(handles(1));

% Background:
I=imread('board.jpg');
handles(2) = imshow(I);
set(handles(2));

%Ponts
handles(3) = line([543 496], [494 482]);
set(handles(3),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(4) = line([626 598], [419 372]);
set(handles(4),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(5) = line([680 636], [288 254]);
set(handles(5),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(6) = line([230 173], [447 451]);
set(handles(6),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(7) = line([527 564], [408 363]);
set(handles(7),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(8) = line([412 441], [406 355]);
set(handles(8),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(9) = line([266 244], [419 366]);
set(handles(9),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(10) = line([142 197], [391 372]);
set(handles(10),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(11) = line([90 134], [357 321]);
set(handles(11),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(12) = line([59 66], [327 273]);
set(handles(12),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(13) = line([565 509], [361 340]);
set(handles(13),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(14) = line([583 583], [319 259]);
set(handles(14),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(15) = line([310 254], [334 342]);
set(handles(15),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(16) = line([516 563], [304 264]);
set(handles(16),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(17) = line([454 419], [277 232]);
set(handles(17),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(18) = line([333 286], [298 266]);
set(handles(18),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(19) = line([201 152], [314 292]);
set(handles(19),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(20) = line([216 246], [313 265]);
set(handles(20),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(21) = line([180 235], [253 245]);
set(handles(21),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(22) = line([157 116], [249 208]);
set(handles(22),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(23) = line([573 529], [223 185]);
set(handles(23),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(24) = line([607 577], [141 88]);
set(handles(24),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(25) = line([351 294], [219 242]);
set(handles(25),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(26) = line([293 236], [163 147]);
set(handles(26),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(27) = line([448 453], [155 99]);
set(handles(27),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(28) = line([244 201], [210 171]);
set(handles(28),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
handles(29) = line([228 285], [118 101]);
set(handles(29),'LineWidth',5,'Color',[0.5 0.5 0.5]) ;
for i = 1:27
    % pont =T_corrpont(i,2);
    % pont=pont{1};
    pont = char(T_corrpont(i,2));
    set(handles(2+i),'ButtonDownFcn',{@CallbackPont,pont});%Callback pour chaque pont
end

%Bouton poussoir pour la pile
handles(30) = uicontrol ('style' , 'push' , 'position' , [510 250 60 20],'string' , 'Pile' , 'Callback',{@CallbackPile});
set(handles(30),'foregroundc',[1 1 1]);

%Bouton pour les cartes du joueurCourant
handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);

joueurCourant = eval(nomJoueurCourant);

if (joueurCourant.cartes.size>=1)
    carte_temp=eval(joueurCourant.cartes.get(1));
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=2)
    carte_temp=eval(joueurCourant.cartes.get(2)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=3)
    carte_temp=eval(joueurCourant.cartes.get(3)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=4)
    carte_temp=eval(joueurCourant.cartes.get(4)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size==5)
    carte_temp=eval(joueurCourant.cartes.get(5)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
end
clear carte_temp ile_carte_temp

clear joueurCourant

%Bouton poussoir pour les cartes face découvertes.
handles(36)=uicontrol('Style','push','String','','position',[420 60 60 20]);
handles(37)=uicontrol('Style','push','String','','position',[420 60 60 20]);
handles(38)=uicontrol('Style','push','String','','position',[420 60 60 20]);
if (pioche.size>=1)
    carte_temp=eval(cartesDecouvertes.get(1)) ;
    carte_temp=carte_temp.ile.nom ;
    handles(36)=uicontrol('Style','push','String',carte_temp,'position',[420 60 60 20],'Callback',{@CallbackCarteDec,cartesDecouvertes.get(1),36}) ;
end
if (pioche.size>=2)
    carte_temp=eval(cartesDecouvertes.get(2)) ;
    carte_temp=carte_temp.ile.nom ;
    handles(37)=uicontrol('Style','push','String',carte_temp,'position',[480 60 60 20],'Callback',{@CallbackCarteDec,cartesDecouvertes.get(2),37}) ;
end
if (pioche.size>=3)
    carte_temp=eval(cartesDecouvertes.get(3)) ;
    carte_temp=carte_temp.ile.nom ;
    handles(38)=uicontrol('Style','push','String',carte_temp,'position',[540 60 60 20],'Callback',{@CallbackCarteDec,cartesDecouvertes.get(3),38}) ;
end
clear carte_temp

%Pions de possession d'ile
for (i=1:12)
    r = 21; %radius of the circle
    ile=char(T_corrile(i,2));
    ile=eval(ile);
    a = ile.coordx; %x-coordinate of the centre of the circle
    b = ile.coordy; %y-coordinate of the centre of the circle
    t = 0:2*pi/360:2*pi; %angle that the ray from (a,b) to (x,y) makes with the x-axis
    X = a+r*cos(t);
    Y = b+r*sin(t);
    handles(38+i) = patch(X,Y,[0.5 0.5 0.5]);
    set(handles(38+i),'Visible','off')
end
clear ile

handles(51)=uicontrol('Style','text','String','Joueur 1 - Blanc','position',[85 420 90 20]);

end


%**************************************************************************

%**************************************************************************
function CallbackPont(~,~,pont)%CHECK
% Lance la construction ou la destruction du pont concerné

run globalization

pont_objet=eval(pont);
joueurCourant=eval(nomJoueurCourant);

pont_ancienchoix=tourEnCours(1,1);
pont_ancienchoix=pont_ancienchoix{1};


if not(pont_ancienchoix=='0')
    pont_ancienchoix=eval(pont_ancienchoix);
    pont_ancienchoix=pont_ancienchoix.id;
    if (T_possesspont(pont_ancienchoix,2)==0)
        set(handles(2+pont_ancienchoix),'Color',[0.5 0.5 0.5]);
    elseif (T_possesspont(pont_ancienchoix,2)==1)
        set(handles(2+pont_ancienchoix),'Color',[1 1 1]);
    else
        set(handles(2+pont_ancienchoix),'Color',[0 0 0]);
    end
end


if (T_possesspont(pont_objet.id,2)==0);
    action=1;
    tourEnCours(1,1)=cellstr(pont_objet.nom);
    set(handles(2+pont_objet.id),'Color',[0.7 0.3 0.5]);
elseif (mod(T_possesspont(pont_objet.id,2),2)==mod(tour,2))
    display('Vous possédez déjà ce pont');
else
    action=2;
    tourEnCours(1,1)=cellstr(pont_objet.nom);
    set(handles(2+pont_objet.id),'Color',[0.7 0.3 0.5]);
end
if (pont_ancienchoix==pont_objet.id)
    if (T_possesspont(pont_ancienchoix,2)==0)
        set(handles(2+pont_ancienchoix),'Color',[0.5 0.5 0.5]);
    elseif (T_possesspont(pont_ancienchoix,2)==1)
        set(handles(2+pont_ancienchoix),'Color',[1 1 1]);
    else
        set(handles(2+pont_ancienchoix),'Color',[0 0 0]);
    end
    action=0;
    tourEnCours=[cellstr('0'),cellstr('0'),cellstr('0')];
end
clear pont_objet pont_id
end
%**************************************************************************

%**************************************************************************
function CallbackCarte(~,~,carte_selec)%CHECK
%Lance la construction ou la destruction du pont concerné
run globalization
carte_pont1=tourEnCours(1,2);
carte_pont1=carte_pont1{1};
joueurCourant = eval(nomJoueurCourant);
disp(carte_selec)


if (action==0)
    carte_selec=eval(carte_selec);
    defausser(carte_selec,joueurCourant.nom)
    handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
    handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
    handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
    handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
    handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);
    
    joueurCourant = eval(nomJoueurCourant);
    
    if (joueurCourant.cartes.size>=1)
        carte_temp=eval(joueurCourant.cartes.get(1));
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=2)
        carte_temp=eval(joueurCourant.cartes.get(2)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=3)
        carte_temp=eval(joueurCourant.cartes.get(3)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=4)
        carte_temp=eval(joueurCourant.cartes.get(4)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size==5)
        carte_temp=eval(joueurCourant.cartes.get(5)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
    end
    clear carte_temp ile_carte_temp
    
    clear joueurCourant
    
else
    joueurCourant=eval(nomJoueurCourant);
    if (carte_pont1=='0')
        tourEnCours(1,2)=cellstr(carte_selec);
        if (action==1)
            pont_toBuild=tourEnCours(1,1);
            pont_toBuild=pont_toBuild{1};
            pont_toBuild=eval(pont_toBuild);%Dans la méthode on doit mettre en argument l'objet de la classe
            nomJoueur=nomJoueurCourant;
            build(pont_toBuild,carte_selec);
            
            action=0;
            tourEnCours=[cellstr('0'),cellstr('0'),cellstr('0')];
            pont_toBuild=pont_toBuild.id;
            
            run actualisationPont
            
            handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
            handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
            handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
            handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
            handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);
            
            joueurCourant = eval(nomJoueurCourant);
            
            if (joueurCourant.cartes.size>=1)
                carte_temp=eval(joueurCourant.cartes.get(1));
                ile_carte_temp=carte_temp.ile.nom ;
                set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
            end
            clear carte_temp ile_carte_temp
            
            if (joueurCourant.cartes.size>=2)
                carte_temp=eval(joueurCourant.cartes.get(2)) ;
                ile_carte_temp=carte_temp.ile.nom ;
                set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
            end
            clear carte_temp ile_carte_temp
            
            if (joueurCourant.cartes.size>=3)
                carte_temp=eval(joueurCourant.cartes.get(3)) ;
                ile_carte_temp=carte_temp.ile.nom ;
                set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
            end
            clear carte_temp ile_carte_temp
            
            if (joueurCourant.cartes.size>=4)
                carte_temp=eval(joueurCourant.cartes.get(4)) ;
                ile_carte_temp=carte_temp.ile.nom ;
                set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
            end
            clear carte_temp ile_carte_temp
            
            if (joueurCourant.cartes.size==5)
                carte_temp=eval(joueurCourant.cartes.get(5)) ;
                ile_carte_temp=carte_temp.ile.nom ;
                set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
            end
            clear carte_temp ile_carte_temp
            
            clear joueurCourant
            
            %Mise à jour des pions de possession d'ile
            run majPions
            
        end
    else
        carte_pont2=carte_selec;
        tourEnCours(1,3)=cellstr(carte_pont2);
        pont_toDestroy=tourEnCours(1,1);
        pont_toDestroy=pont_toDestroy{1};
        pont_toDestroy=eval(pont_toDestroy);
        detruire(pont_toDestroy,carte_pont1,carte_pont2,nomJoueurCourant)
        
        if (T_possesspont(pont_toDestroy.id,2)==0)
            set(handles(2+pont_toDestroy.id),'Color',[0.5 0.5 0.5]);
        elseif (T_possesspont(pont_toDestroy.id,2)==1)
            set(handles(2+pont_toDestroy.id),'Color',[1 1 1]);
        else
            set(handles(2+pont_toDestroy.id),'Color',[0 0 0]);
        end
        
        pont_toDestroy=pont_toDestroy.id;
        tourEnCours=[cellstr('0'),cellstr('0'),cellstr('0')];
        
        handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
        handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
        handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
        handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
        handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);
        
        joueurCourant = eval(nomJoueurCourant);
        
        if (joueurCourant.cartes.size>=1)
            carte_temp=eval(joueurCourant.cartes.get(1));
            ile_carte_temp=carte_temp.ile.nom ;
            set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
        end
        clear carte_temp ile_carte_temp
        
        if (joueurCourant.cartes.size>=2)
            carte_temp=eval(joueurCourant.cartes.get(2)) ;
            ile_carte_temp=carte_temp.ile.nom ;
            set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
        end
        clear carte_temp ile_carte_temp
        
        if (joueurCourant.cartes.size>=3)
            carte_temp=eval(joueurCourant.cartes.get(3)) ;
            ile_carte_temp=carte_temp.ile.nom ;
            set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
        end
        clear carte_temp ile_carte_temp
        
        if (joueurCourant.cartes.size>=4)
            carte_temp=eval(joueurCourant.cartes.get(4)) ;
            ile_carte_temp=carte_temp.ile.nom ;
            set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
        end
        clear carte_temp ile_carte_temp
        
        if (joueurCourant.cartes.size==5)
            carte_temp=eval(joueurCourant.cartes.get(5)) ;
            ile_carte_temp=carte_temp.ile.nom ;
            set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
        end
        clear carte_temp ile_carte_temp
        
        clear joueurCourant
        
        %Mise à jour des pions de possession d'ile
        run majPions
        
    end
end
end


%**************************************************************************

%**************************************************************************
function CallbackPile(~,~)%CHECK
% Lance la construction ou la destruction du pont concerné

run globalization
if (pioche.size==0)
    finManche=1;
    
    point1=0;
    point2=0;
    for i=1:12
        if (T_possessile==1)
            point1=point1+1;
        elseif (T_possessile==2)
            point2=point2+1;
        end
    end
    if (point1>point2)
        button = questdlg('Le joueur1 gagne','Game over','Rejouer','Arrêter','Rejouer');
    elseif (point1<point2)
        button = questdlg('Le joueur2 gagne','Game over','Rejouer','Arrêter','Rejouer');
    else
        button = questdlg('Egalité','Game over','Rejouer','Arrêter','Rejouer');
    end
    if (strcmp(button,'Rejouer'))
        run start;
    else
        close all
    end
else
    joueurCourant = eval(nomJoueurCourant);
    piocher_pioche(joueurCourant)
    
    handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
    handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
    handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
    handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
    handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);
    
    if (joueurCourant.cartes.size>=1)
        carte_temp=eval(joueurCourant.cartes.get(1));
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=2)
        carte_temp=eval(joueurCourant.cartes.get(2)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=3)
        carte_temp=eval(joueurCourant.cartes.get(3)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=4)
        carte_temp=eval(joueurCourant.cartes.get(4)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size==5)
        carte_temp=eval(joueurCourant.cartes.get(5)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
    end
    clear carte_temp ile_carte_temp
    
    clear joueurCourant
    
    if (pioche.size==0)
        point1=0;
        point2=0;
        for i=1:12
            if (T_possessile==1)
                point1=point1+1;
            elseif (T_possessile==2)
                point2=point2+1;
            end
        end
        if (point1>point2)
            button = questdlg('Le joueur1 gagne','Game over','Rejouer','Arrêter','Rejouer');
        elseif (point1<point2)
            button = questdlg('Le joueur2 gagne','Game over','Rejouer','Arrêter','Rejouer');
        else
            button = questdlg('Egalité','Game over','Rejouer','Arrêter','Rejouer');
        end
        if (strcmp(button,'Rejouer'))
            run start;
        else
            close all
        end
    end
    
    %Changement de Joueur 1<->2
    tour = tour+1;
    run changementJoueurCourant
    handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
    handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
    handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
    handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
    handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);
    joueurCourant=eval(nomJoueurCourant);
    if (joueurCourant.cartes.size>=1)
        carte_temp=eval(joueurCourant.cartes.get(1));
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=2)
        carte_temp=eval(joueurCourant.cartes.get(2)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=3)
        carte_temp=eval(joueurCourant.cartes.get(3)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size>=4)
        carte_temp=eval(joueurCourant.cartes.get(4)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
    end
    clear carte_temp ile_carte_temp
    
    if (joueurCourant.cartes.size==5)
        carte_temp=eval(joueurCourant.cartes.get(5)) ;
        ile_carte_temp=carte_temp.ile.nom ;
        set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
    end
    clear carte_temp ile_carte_temp
    if (mod(tour,2)==1)
        set(handles(51),'String','Joueur 1 - Blanc');
    else
        set(handles(51),'String','Joueur 2 - Noir');
    end
end
end
%**************************************************************************

%**************************************************************************
function CallbackCarteDec(~,~,carte,nHandles)%A faire
% Lance la construction ou la destruction du pont concerné

run globalization

joueurCourant = eval(nomJoueurCourant);

numHandles=nHandles;
piocher_troiscartes(joueurCourant,carte)

handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);
joueurCourant=eval(nomJoueurCourant);
if (joueurCourant.cartes.size>=1)
    carte_temp=eval(joueurCourant.cartes.get(1));
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=2)
    carte_temp=eval(joueurCourant.cartes.get(2)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=3)
    carte_temp=eval(joueurCourant.cartes.get(3)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=4)
    carte_temp=eval(joueurCourant.cartes.get(4)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size==5)
    carte_temp=eval(joueurCourant.cartes.get(5)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
end
clear carte_temp ile_carte_temp

clear joueurCourant

handles(36)=uicontrol('Style','push','String','','position',[420 60 60 20]);
handles(37)=uicontrol('Style','push','String','','position',[420 60 60 20]);
handles(38)=uicontrol('Style','push','String','','position',[420 60 60 20]);
if (pioche.size>=1)
    carte_temp=eval(cartesDecouvertes.get(1)) ;
    carte_temp=carte_temp.ile.nom ;
    handles(36)=uicontrol('Style','push','String',carte_temp,'position',[420 60 60 20],'Callback',{@CallbackCarteDec,cartesDecouvertes.get(1),36}) ;
end
if (pioche.size>=2)
    carte_temp=eval(cartesDecouvertes.get(2)) ;
    carte_temp=carte_temp.ile.nom ;
    handles(37)=uicontrol('Style','push','String',carte_temp,'position',[480 60 60 20],'Callback',{@CallbackCarteDec,cartesDecouvertes.get(2),37}) ;
end
if (pioche.size>=3)
    carte_temp=eval(cartesDecouvertes.get(3)) ;
    carte_temp=carte_temp.ile.nom ;
    handles(38)=uicontrol('Style','push','String',carte_temp,'position',[540 60 60 20],'Callback',{@CallbackCarteDec,cartesDecouvertes.get(3),38}) ;
end
clear carte_temp

if (pioche.size==0)
    point1=0;
    point2=0;
    for i=1:12
        if (T_possessile==1)
            point1=point1+1;
        elseif (T_possessile==2)
            point2=point2+1;
        end
    end
    if (point1>point2)
        button = questdlg('Le joueur1 gagne','Game over','Rejouer','Arrêter','Rejouer');
    elseif (point1<point2)
        button = questdlg('Le joueur2 gagne','Game over','Rejouer','Arrêter','Rejouer');
    else
        button = questdlg('Egalité','Game over','Rejouer','Arrêter','Rejouer');
    end
    if (strcmp(button,'Rejouer'))
        run start;
    else
        close all
    end
end

%Changement de Joueur 1<->2
tour = tour+1;
run changementJoueurCourant
handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);
joueurCourant=eval(nomJoueurCourant);
if (joueurCourant.cartes.size>=1)
    carte_temp=eval(joueurCourant.cartes.get(1));
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=2)
    carte_temp=eval(joueurCourant.cartes.get(2)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=3)
    carte_temp=eval(joueurCourant.cartes.get(3)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=4)
    carte_temp=eval(joueurCourant.cartes.get(4)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size==5)
    carte_temp=eval(joueurCourant.cartes.get(5)) ;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
end
clear carte_temp ile_carte_temp

clear joueurCourant

if (mod(tour,2)==1)
    set(handles(51),'String','Joueur 1 - Blanc');
else
    set(handles(51),'String','Joueur 2 - Noir');
end

end
%**************************************************************************
