%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%               GENERATION JEU
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run globalization

%Génération joueurs
joueur1 = Joueur('joueur1',1);
joueur2 = Joueur('joueur2',2);
joueur1.nomAutreJoueur = joueur2.nom ;
joueur2.nomAutreJoueur = joueur1.nom ;

%Génération îles
aloa=Ile('aloa',1,3,657,478);
bari=Ile('bari',2,5,410,429);
coco=Ile('coco',3,4,131,414);
duda=Ile('duda',4,4,585,345);
elai=Ile('elai',5,6,469,303);
faaa=Ile('faaa',6,5,229,343);
gola=Ile('gola',7,4,148,275);
huna=Ile('huna',8,5,601,235);
iffi=Ile('iffi',9,5,377,200);
jojo=Ile('jojo',10,5,260,242);
kahu=Ile('kahu',11,5,213,144);
lale=Ile('lale',12,3,458,79);

%Génération cartes
aloa1=Carte('aloa1',1,aloa,0);
bari1=Carte('bari1',2,bari,0);
coco1=Carte('coco1',3,coco,0);
duda1=Carte('duda1',4,duda,0);
elai1=Carte('elai1',5,elai,0);
faaa1=Carte('faaa1',6,faaa,0);
gola1=Carte('gola1',7,gola,0);
huna1=Carte('huna1',8,huna,0);
iffi1=Carte('iffi1',9,iffi,0);
jojo1=Carte('jojo1',10,jojo,0);
kahu1=Carte('kahu1',11,kahu,0);
lale1=Carte('lale1',12,lale,0);

aloa2=Carte('aloa2',13,aloa,0);
bari2=Carte('bari2',14,bari,0);
coco2=Carte('coco2',15,coco,0);
duda2=Carte('duda2',16,duda,0);
elai2=Carte('elai2',17,elai,0);
faaa2=Carte('faaa2',18,faaa,0);
gola2=Carte('gola2',19,gola,0);
huna2=Carte('huna2',20,huna,0);
iffi2=Carte('iffi2',21,iffi,0);
jojo2=Carte('jojo2',22,jojo,0);
kahu2=Carte('kahu2',23,kahu,0);
lale2=Carte('lale2',24,lale,0);

%Génération ponts
ilesAdjacentesab = java.util.HashMap;
ilesAdjacentesab.put(1,'aloa');
ilesAdjacentesab.put(2,'bari');

ilesAdjacentesad = java.util.HashMap;
ilesAdjacentesad.put(1,'aloa');
ilesAdjacentesad.put(2,'duda');

ilesAdjacentesah = java.util.HashMap;
ilesAdjacentesah.put(1,'aloa');
ilesAdjacentesah.put(2,'huna');

ilesAdjacentesbc = java.util.HashMap;
ilesAdjacentesbc.put(1,'bari');
ilesAdjacentesbc.put(2,'coco');

ilesAdjacentesbd = java.util.HashMap;
ilesAdjacentesbd.put(1,'bari');
ilesAdjacentesbd.put(2,'duda');

ilesAdjacentesbe = java.util.HashMap;
ilesAdjacentesbe.put(1,'bari');
ilesAdjacentesbe.put(2,'elai');

ilesAdjacentesbf = java.util.HashMap;
ilesAdjacentesbf.put(1,'bari');
ilesAdjacentesbf.put(2,'faaa');

ilesAdjacentescf = java.util.HashMap;
ilesAdjacentescf.put(1,'coco');
ilesAdjacentescf.put(2,'faaa');

ilesAdjacentescg = java.util.HashMap;
ilesAdjacentescg.put(1,'coco');
ilesAdjacentescg.put(2,'gola');

ilesAdjacentesck = java.util.HashMap;
ilesAdjacentesck.put(1,'coco');
ilesAdjacentesck.put(2,'kahu');

ilesAdjacentesde = java.util.HashMap;
ilesAdjacentesde.put(1,'duda');
ilesAdjacentesde.put(2,'elai');

ilesAdjacentesdh = java.util.HashMap;
ilesAdjacentesdh.put(1,'duda');
ilesAdjacentesdh.put(2,'huna');

ilesAdjacentesef = java.util.HashMap;
ilesAdjacentesef.put(1,'elai');
ilesAdjacentesef.put(2,'faaa');

ilesAdjacenteseh = java.util.HashMap;
ilesAdjacenteseh.put(1,'elai');
ilesAdjacenteseh.put(2,'huna');

ilesAdjacentesei = java.util.HashMap;
ilesAdjacentesei.put(1,'elai');
ilesAdjacentesei.put(2,'iffi');

ilesAdjacentesej = java.util.HashMap;
ilesAdjacentesej.put(1,'elai');
ilesAdjacentesej.put(2,'jojo');

ilesAdjacentesfg = java.util.HashMap;
ilesAdjacentesfg.put(1,'faaa');
ilesAdjacentesfg.put(2,'gola');

ilesAdjacentesfj = java.util.HashMap;
ilesAdjacentesfj.put(1,'faaa');
ilesAdjacentesfj.put(2,'jojo');

ilesAdjacentesgj = java.util.HashMap;
ilesAdjacentesgj.put(1,'gola');
ilesAdjacentesgj.put(2,'jojo');

ilesAdjacentesgk = java.util.HashMap;
ilesAdjacentesgk.put(1,'gola');
ilesAdjacentesgk.put(2,'kahu');

ilesAdjacenteshi = java.util.HashMap;
ilesAdjacenteshi.put(1,'huna');
ilesAdjacenteshi.put(2,'elai');

ilesAdjacenteshl = java.util.HashMap;
ilesAdjacenteshl.put(1,'huna');
ilesAdjacenteshl.put(2,'elai');

ilesAdjacentesij = java.util.HashMap;
ilesAdjacentesij.put(1,'iffi');
ilesAdjacentesij.put(2,'jojo');

ilesAdjacentesik = java.util.HashMap;
ilesAdjacentesik.put(1,'iffi');
ilesAdjacentesik.put(2,'kahu');

ilesAdjacentesil= java.util.HashMap;
ilesAdjacentesil.put(1,'iffi');
ilesAdjacentesil.put(2,'lale');

ilesAdjacentesjk = java.util.HashMap;
ilesAdjacentesjk.put(1,'jojo');
ilesAdjacentesjk.put(2,'kahu');

ilesAdjacentesjl = java.util.HashMap;
ilesAdjacentesjl.put(1,'jojo');
ilesAdjacentesjl.put(2,'lale');

ilesAdjacenteskl = java.util.HashMap;
ilesAdjacenteskl.put(1,'kahu');
ilesAdjacenteskl.put(2,'lale');


% Creation des ponts et ajout aux iles
% Les coordonnées sont données à partir du haut à gauche
ab=Pont('ab',1,ilesAdjacentesab,543,494,496,482);
addPont(aloa,'ab');
addPont(bari,'ab');
ad=Pont('ad',2,ilesAdjacentesad,626,419,598,372);
addPont(aloa,'ad');
addPont(duda,'ad');
ah=Pont('ah',3,ilesAdjacentesah,680,288,636,254);
addPont(aloa,'ah');
addPont(huna,'ah');
bc=Pont('bc',4,ilesAdjacentesbc,230,447,173,451);
addPont(bari,'bc');
addPont(coco,'bc');
bd=Pont('bd',5,ilesAdjacentesbd,527,408,564,363);
addPont(bari,'bd');
addPont(duda,'bd');
be=Pont('be',6,ilesAdjacentesbe,412,406,441,355);
addPont(bari,'be');
addPont(elai,'be');
bf=Pont('bf',7,ilesAdjacentesbf,266,419,244,366);
addPont(bari,'bf');
addPont(faaa,'bf');
cf=Pont('cf',8,ilesAdjacentescf,142,391,197,372);
addPont(coco,'cf');
addPont(faaa,'cf');
cg=Pont('cg',9,ilesAdjacentescg,90,357,134,321);
addPont(coco,'cg');
addPont(gola,'cg');
ck=Pont('ck',10,ilesAdjacentesck,59,327,66,273);
addPont(coco,'ck');
addPont(kahu,'ck');
de=Pont('de',11,ilesAdjacentesde,565,361,509,340);
addPont(duda,'de');
addPont(elai,'de');
dh=Pont('dh',12,ilesAdjacentesdh,583,319,583,259);
addPont(duda,'dh');
addPont(huna,'dh');
ef=Pont('ef',13,ilesAdjacentesef,310,334,254,342);
addPont(elai,'ef');
addPont(elai,'ef');
eh=Pont('eh',14,ilesAdjacenteseh,516,304,563,264);
addPont(elai,'eh');
addPont(elai,'eh');
ei=Pont('ei',15,ilesAdjacentesei,454,277,419,232);
addPont(elai,'ei');
addPont(elai,'ei');
ej=Pont('ej',16,ilesAdjacentesej,333,298,286,266);
addPont(elai,'ej');
addPont(elai,'ej');
fg=Pont('fg',17,ilesAdjacentesfg,201,314,152,292);
addPont(faaa,'fg');
addPont(gola,'fg');
fj=Pont('fj',18,ilesAdjacentesfj,216,313,246,265);
addPont(faaa,'fj');
addPont(jojo,'fj');
gj=Pont('gj',19,ilesAdjacentesgj,180,253,235,245);
addPont(gola,'gj');
addPont(jojo,'gj');
gk=Pont('gk',20,ilesAdjacentesgk,157,249,116,208);
addPont(gola,'gk');
addPont(kahu,'gk');
hi=Pont('hi',21,ilesAdjacenteshi,573,223,529,185);
addPont(huna,'hi');
addPont(iffi,'hi');
hl=Pont('hl',22,ilesAdjacenteshl,607,141,577,88);
addPont(huna,'hl');
addPont(lale,'hl');
ij=Pont('ij',23,ilesAdjacentesij,351,219,294,242);
addPont(iffi,'ij');
addPont(jojo,'ij');
ik=Pont('ik',24,ilesAdjacentesik,293,163,236,147);
addPont(iffi,'ik');
addPont(kahu,'ik');
il=Pont('il',25,ilesAdjacentesil,448,155,453,99);
addPont(iffi,'il');
addPont(lale,'il');
jk=Pont('jk',26,ilesAdjacentesjk,244,210,201,171);
addPont(jojo,'jk');
addPont(kahu,'jk');
kl=Pont('kl',27,ilesAdjacenteskl,228,118,285,101);
addPont(kahu,'kl');
addPont(lale,'kl');

% Ajout des cartes aux iles
aloa.cartes.put(1,'aloa1');
aloa.cartes.put(2,'aloa2');

bari.cartes.put(1,'bari1');
bari.cartes.put(2,'bari2');

coco.cartes.put(1,'coco1');
coco.cartes.put(2,'coco2');

duda.cartes.put(1,'duda1');
duda.cartes.put(2,'duda2');

elai.cartes.put(1,'elai1');
elai.cartes.put(2,'elai2');

faaa.cartes.put(1,'faaa1');
faaa.cartes.put(2,'faaa2');

gola.cartes.put(1,'gola1');
gola.cartes.put(2,'gola2');

huna.cartes.put(1,'huna1');
huna.cartes.put(2,'huna2');

iffi.cartes.put(1,'iffi1');
iffi.cartes.put(2,'iffi2');

jojo.cartes.put(1,'jojo1');
jojo.cartes.put(2,'jojo2');

kahu.cartes.put(1,'kahu1');
kahu.cartes.put(2,'kahu2');

lale.cartes.put(1,'lale1');
lale.cartes.put(2,'lale2');

%Tableau de correspondance ponts-identifiant
T_corrpont= [[1,cellstr('ab')] ; [2,cellstr('ad')] ; [3,cellstr('ah')] ; 
            [4,cellstr('bc')] ; [5,cellstr('bd')] ; [6,cellstr('be')] ;
            [7,cellstr('bf')] ; [8,cellstr('cf')] ; [9,cellstr('cg')] ;
            [10,cellstr('ck')] ; [11,cellstr('de')] ; [12,cellstr('dh')] ;
            [13,cellstr('ef')] ; [14,cellstr('eh')] ; [15,cellstr('ei')] ;
            [16,cellstr('ej')] ; [17,cellstr('fg')] ; [18,cellstr('fj')] ;
            [19,cellstr('gj')] ; [20,cellstr('gk')] ; [21,cellstr('hi')] ;
            [22,cellstr('hl')] ; [23,cellstr('ij')] ; [24,cellstr('ik')] ;
            [25,cellstr('il')] ; [26,cellstr('jk')] ; [27,cellstr('kl')]];
        
%Tableau de correspondance identifiant d'une carte - ile
T_corrile= [[1,cellstr('aloa')] ; [2,cellstr('bari')] ; [3,cellstr('coco')] ; 
           [4,cellstr('duda')] ; [5,cellstr('elai')] ; [6,cellstr('faaa')] ;
           [7,cellstr('gola')] ; [8,cellstr('huna')] ; [9,cellstr('iffi')] ;
           [10,cellstr('jojo')] ; [11,cellstr('kahu')] ; [12,cellstr('lale')] ;
           [13,cellstr('aloa')] ; [14,cellstr('bari')] ; [15,cellstr('coco')] ;
           [16,cellstr('duda')] ; [17,cellstr('elai')] ; [18,cellstr('faaa')] ;
           [19,cellstr('gola')] ; [20,cellstr('huna')] ; [21,cellstr('iffi')] ;
           [22,cellstr('jojo')] ; [23,cellstr('kahu')] ; [24,cellstr('lale')]];

%Tableau de correspondance identifiant d'une carte - carte
T_corrcarte= [[1,cellstr('aloa1')] ; [2,cellstr('bari1')] ; [3,cellstr('coco1')] ; 
             [4,cellstr('duda1')] ; [5,cellstr('elai1')] ; [6,cellstr('faaa1')] ;
             [7,cellstr('gola1')] ; [8,cellstr('huna1')] ; [9,cellstr('iffi1')] ;
             [10,cellstr('jojo1')] ; [11,cellstr('kahu1')] ; [12,cellstr('lale1')] ;
             [13,cellstr('aloa2')] ; [14,cellstr('bari2')] ; [15,cellstr('coco2')] ;
             [16,cellstr('duda2')] ; [17,cellstr('elai2')] ; [18,cellstr('faaa2')] ;
             [19,cellstr('gola2')] ; [20,cellstr('huna2')] ; [21,cellstr('iffi2')] ;
             [22,cellstr('jojo2')] ; [23,cellstr('kahu2')] ; [24,cellstr('lale2')]];

% Tables des possessions
% Iles :
% en première colonne les identifiants des iles,
% en deuxième colonne les id des joueurs
T_possessile = [];
for i=1:24
  T_possessile = [T_possessile;[i,0]];
end

% Ponts :
% en première colonne les identifiants,
% en deuxième colonne les id des joueurs
T_possesspont = [];
for i=1:27
  T_possesspont = [T_possesspont;[i,0]];
end

%Variables utiles
tour = 1;
nomJoueurCourant = joueur1.nom;
finManche=0;
% Liste workspace
% listworkspace = who ;


% Nettoyage des variables inutiles
clear ilesAdjacentesab ilesAdjacentesad ilesAdjacentesah ilesAdjacentesbc ilesAdjacentesbd ilesAdjacentesbe ilesAdjacentesbf ilesAdjacentescf ilesAdjacentescg ilesAdjacentesck ilesAdjacentesde ilesAdjacentesdh ilesAdjacentesef ilesAdjacenteseh ilesAdjacentesei ilesAdjacentesej ilesAdjacentesfg ilesAdjacentesfj ilesAdjacentesgj ilesAdjacentesgk ilesAdjacenteshi ilesAdjacenteshl ilesAdjacentesij ilesAdjacentesik ilesAdjacentesil ilesAdjacentesjk ilesAdjacentesjl ilesAdjacenteskl;


