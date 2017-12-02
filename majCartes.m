handles(31)= uicontrol('Style','push','String','','position',[90 60 60 20]);
handles(32)= uicontrol('Style','push','String','','position',[150 60 60 20]);
handles(33)= uicontrol('Style','push','String','','position',[210 60 60 20]);
handles(34)= uicontrol('Style','push','String','','position',[270 60 60 20]);
handles(35)= uicontrol('Style','push','String','','position',[330 60 60 20]);

joueurCourant = eval(nomJoueurCourant);

if (joueurCourant.cartes.size>=1)
    carte_temp=eval(joueurCourant.cartes.get(1));
    carte_temp.nHandles=31;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(31),'Style','push','String',ile_carte_temp,'position',[90 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(1)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=2)
    carte_temp=eval(joueurCourant.cartes.get(2)) ;
    carte_temp.nHandles=32;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(32),'Style','push','String',ile_carte_temp,'position',[150 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(2)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=3)
    carte_temp=eval(joueurCourant.cartes.get(3)) ;
    carte_temp.nHandles=33;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(33),'Style','push','String',ile_carte_temp,'position',[210 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(3)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size>=4)
    carte_temp=eval(joueurCourant.cartes.get(4)) ;
    carte_temp.nHandles=34;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(34),'Style','push','String',ile_carte_temp,'position',[270 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(4)});
end
clear carte_temp ile_carte_temp

if (joueurCourant.cartes.size==5)
    carte_temp=eval(joueurCourant.cartes.get(5)) ;
    carte_temp.nHandles=35;
    ile_carte_temp=carte_temp.ile.nom ;
    set(handles(35),'Style','push','String',ile_carte_temp,'position',[330 60 60 20],'Callback',{@CallbackCarte,joueurCourant.cartes.get(5)});
end
clear carte_temp ile_carte_temp

clear joueurCourant