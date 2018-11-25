/* Tugas Besar Logif */
/* Kelompok Kok ada tubes? */
/* 1. M Nobel Fauzan    - 13517--- */
/* 2. Vinsen Marsellino - 13517--- */
/* 3. Sekar Larasati M  - 13517--- */
/* 4. Nurul Utami A W   - 13517--- */

/* predikat dinamik */
:- dynamic(object_loc/3).
:- dynamic(position/2).
:- dynamic(health/1).
:- dynamic(jmlarmor/1).
:- dynamic(armor/2).
:- dynamic(jmlammo/1).
:- dynamic(ammo/2).
:- dynamic(used_weapon/1).
:- dynamic(weapon/2).
:- dynamic(inventory/1).
:- dynamic(inventory_cap/1).
:- dynamic(enemy/3).
:- dynamic(enemy_num/1).
:- dynamic(medicine/2).
:- dynamic(playtime/1).

init :- 
    /* Fakta pemain */
    /* Setting awal player */
    asserta(position(7,8)), /* posisi awal player pada petak (7,8) */
    asserta(health(100)),
		asserta(jmlarmor(0)),
    asserta(used_weapon(none)),
    asserta(jmlammo(0)),
    asserta(inventory([])),
    asserta(inventory_cap(5)), /* kapasitas maksimum inventory adalah 5 */
	asserta(playtime(0)),
    /* Fakta peta */
    /* Deskripsi peta : */
    /* -- Petak - petak pada peta dapat diakses dengan koordinat (x,y) */
    /* -- Ukuran peta 15 x 15 */
	/* Fakta objek-objek dalam permainan */
    /* -- weapon(jenis,attack_power) -- */
    asserta(weapon(awm, 20)),
    asserta(weapon(groza, 18)),
    asserta(weapon(ak47, 17)),
    asserta(weapon(none, 0)),
    /* -- medicine(jenis,recovery_power) --*/
	asserta(medicine(bandage, 20)),
	asserta(medicine(firstaid, 10)),
	/* -- armor(jenis,jmlarmor) -- */
		asserta(armor(millitaryVest,30)),
		asserta(armor(policeVest,20)),
	/* -- ammo(jenis,jmlammo) -- */
		asserta(ammo(dozen,12)),
		asserta(ammo(pile,5)),
	/* Lokasi objek di peta */
    /* -- weapon -- */
    asserta(object_loc(11, 7, awm)),
    asserta(object_loc(5, 7, awm)),
		asserta(object_loc(10, 10, awm)),
		asserta(object_loc(5, 3, awm)),
		asserta(object_loc(13, 12, awm)),
		asserta(object_loc(7, 3, awm)),
		asserta(object_loc(11, 9, groza)),
		asserta(object_loc(4, 7, groza)),
    asserta(object_loc(8, 2, groza)),
    asserta(object_loc(13, 5, groza)),
		asserta(object_loc(11, 9, groza)),
		asserta(object_loc(2, 11, groza)),
    asserta(object_loc(6, 8, ak47)),
    asserta(object_loc(7, 12, ak47)),
    asserta(object_loc(3, 8, ak47)),
    asserta(object_loc(4, 6, ak47)),
    asserta(object_loc(8, 5, ak47)),
    asserta(object_loc(6, 1, ak47)),
	/* -- armor -- */
		asserta(object_loc(2, 14, millitaryVest)),
		asserta(object_loc(3, 4, millitaryVest)),
		asserta(object_loc(4, 7, millitaryVest)),
		asserta(object_loc(5, 13, millitaryVest)),
		asserta(object_loc(6, 2, millitaryVest)),
		asserta(object_loc(7, 10, millitaryVest)),
		asserta(object_loc(9, 5, millitaryVest)),
		asserta(object_loc(10, 6, millitaryVest)),
		asserta(object_loc(12, 8, millitaryVest)),
		asserta(object_loc(13, 11, millitaryVest)),
		asserta(object_loc(14, 9, millitaryVest)),
		asserta(object_loc(2, 3, policeVest)),
		asserta(object_loc(4, 7, policeVest)),
		asserta(object_loc(5, 13, policeVest)),
		asserta(object_loc(7, 7, policeVest)),
		asserta(object_loc(8, 4, policeVest)),
		asserta(object_loc(10, 5, policeVest)),
		asserta(object_loc(11, 6, policeVest)),
		asserta(object_loc(13, 10, policeVest)),
	/* -- medicine -- */
    asserta(object_loc(9, 6, firstaid)),
    asserta(object_loc(7, 7, firstaid)),
    asserta(object_loc(3, 9, firstaid)),
    asserta(object_loc(4, 7, antodote)),
    asserta(object_loc(10, 8, firstaid)),
    asserta(object_loc(5, 7, bandage)),
    asserta(object_loc(8, 6, bandage)),
    asserta(object_loc(3, 11, bandage)),
    asserta(object_loc(10, 7, bandage)),
    asserta(object_loc(9, 8, bandage)),
    asserta(object_loc(7, 8, bandage)),
	/* -- ammo -- */
		asserta(object_loc(2, 5, pile)),
		asserta(object_loc(2, 13, pile)),
		asserta(object_loc(3, 7, pile)),
		asserta(object_loc(4, 8, pile)),
		asserta(object_loc(5, 9, pile)),
		asserta(object_loc(7, 10, pile)),
		asserta(object_loc(8, 3, pile)),
		asserta(object_loc(9, 13, pile)),
		asserta(object_loc(10, 6, pile)),
		asserta(object_loc(12, 11, pile)),
		asserta(object_loc(13, 2, pile)),
		asserta(object_loc(14, 12, pile)),
		asserta(object_loc(3, 11, dozen)),
		asserta(object_loc(4, 3, dozen)),
		asserta(object_loc(6, 12, dozen)),
		asserta(object_loc(7, 4, dozen)),
		asserta(object_loc(11, 7, dozen)),
		asserta(object_loc(12, 10, dozen)),
		asserta(object_loc(13, 13, dozen)),
	/* Fakta musuh */
    asserta(enemy_num(10)), /* jumlah musuh */
    /* -- enemy(nama,health,attack_power) -- */
    asserta(enemy(voldemort, 40, 15)),
    asserta(enemy(bellatrix, 40, 12)),
    asserta(enemy(inheritor, 40, 11)),
    asserta(enemy(symbiote, 40, 9)),
    asserta(enemy(madara, 40, 8)),
    asserta(enemy(obito, 40, 8)),
    asserta(enemy(sullivan, 40, 7)),
    asserta(enemy(wazowski, 40, 6)),
    asserta(enemy(oozmakappa, 40, 6)),
    asserta(enemy(sousky, 40, 5)).

/* Aturan Penalaran */
/* start -- untuk memulai permainan */
start :-
    retractall(object_loc(_,_,_)), retractall(position(_)),
    retractall(health(_)),
    retractall(used_weapon(_)), retractall(weapon(_,_)),
    retractall(inventory(_)),
    retractall(enemy(_,_,_)), retractall(enemy_num(_)),
    asserta(object_loc(0,_,dz)), /* dz : deadzone */
    asserta(object_loc(16,_,dz)),
    asserta(object_loc(_,0,dz)),
    asserta(object_loc(_,16,dz)),
    write('RIP : Rest In Peace!!'), nl,
    write('Welcome to battle royale RIP : Rest In Peace game!!'), nl,
    write('The Biggest Lord has choosen you to be FIGOL.'), nl,
    write('FIGOL is damned creatures which have extremely high stress levels.'), nl,
    write('The mission is to reach "RIP" so you can rest your soul in peace.'), nl,
    nl,nl,write('Have fun with the game and hopefully you can rest in peace! HAHA '), nl,
    nl, help,
    init,
    setenemy.

/* help -- menampilkan command yang dapat digunakan dalam game dan legenda */
help :-
    write('Available commands :'), nl,
    write('   start.          -- start the game !'), nl,
    write('   help.           -- show available commands'), nl,
    write('   quit.           -- quit the game'), nl,
    write('   look.           -- look around'), nl,
    write('   n. s. e. w.     -- move'), nl,
    write('   map.            -- look at the whole battle field and detect enemies'), nl,
    write('   take(Object).   -- pick up an object'), nl,
    write('   drop(Object)    -- drop an object'), nl,
    write('   use(Object)     -- use an object'), nl,
    write('   attack.         -- attack enemy that crosses your path'), nl,
    write('   status.         -- show player status'), nl,
    write('   save(Filename). -- save the game !'), nl,
    write('   load(Filename)  -- load the game !'), nl, nl,
    write('Legends :'), nl,
    write('W : weapon'),nl,
    write('A : armor'),nl,
    write('M : medicine'),nl,
    write('O : ammo'),nl,
    write('P : player'),nl,
    write('E : enemy'),nl,
    write('_ : accescible'),nl,
    write('X : inaccessible').

/* Menetapkan lokasi awal musuh di peta */
setenemy :-
    random(1,15,X), random(1,15,Y), asserta(object_loc(X,Y, voldemort)),
    random(1,15,X1), random(1,15,Y1), asserta(object_loc(X1,Y1, bellatrix)),
    random(1,15,X2), random(1,15,Y2), asserta(object_loc(X2,Y2, inheritor)),
    random(1,15,X3), random(1,15,Y3), asserta(object_loc(X3,Y3, symbiote)),
    random(1,15,X4), random(1,15,Y4), asserta(object_loc(X4,Y4, obito)),
    random(1,15,X5), random(1,15,Y5), asserta(object_loc(X5,Y5, madara)),
    random(1,15,X6), random(1,15,Y6), asserta(object_loc(X6,Y6, sullivan)),
    random(1,15,X7), random(1,15,Y7), asserta(object_loc(X7,Y7, wazowski)),
    random(1,15,X8), random(1,15,Y8), asserta(object_loc(X8,Y8, oozmakappa)),
    random(1,15,X9), random(1,15,Y9), asserta(object_loc(X9,Y9, sousky)).

/* quit -- untuk mengakhiri game */
quit :-
    write('Leaving the bettlefield'), nl,
    retractall(object_loc(_,_,_)), retractall(position(_)),
    retractall(health(_)),
    retractall(used_weapon(_)), retractall(weapon(_,_)),
    retractall(inventory(_)),
    retractall(enemy(_,_,_)), retractall(enemy_num(_)).

/* command aksi dalam permainan */
/* look -- melihat keadaan sekitar player */
look :- cekEnemy, fail.
look :- cekFirstAid, fail.
look :- cekbandage, fail.
look :- cekWeapon, fail.
look :- printMap3x3, !, !.
/* rule terkait command look */
cekEnemy :-
    position(X,Y), object_loc(X,Y, Name), enemy(Name,_,_), write('You see '), write(Name), write('in front of you!'), nl, fail.
cekEnemy :- !.
cekFirstAid :-
    position(X,Y), object_loc(X,Y, firstaid), write('You see firstaid lying in the ground!'), nl, !.
cekbandage :-
    position(X,Y), object_loc(X,Y, bandage), write('You see bandage lying in the ground!'), nl, !.
cekWeapon :-
    position(X,Y), object_loc(X,Y, Name), weapon(Name,_), typeofweapon(Name), !.
/* rule untuk menentukan jenis weapon */
typeofweapon(Name) :- Name = awm, write('You see an awm lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = groza, write('You see a groza lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = ak47, write('You see an ak47 lying in the ground!'), nl, !.
printMap3x3 :-
    position(X,Y),
    Xmin is X-1, Xplus is X+1, Ymin is Y-1, Yplus is Y+1,
    printPetak(Xmin,Ymin), printPetak(Xmin,Y), printPetak(Xmin,Yplus), nl,
    printPetak(X,Ymin), print('P'), printPetak(X,Yplus), nl,
    printPetak(Xplus,Ymin), printPetak(Xplus,Y), printPetak(Xplus,Yplus), !.
/* rule printPetak */
printPetak(P,Q) :- object_loc(P, Q, dz), print('X'), !.
printPetak(P,Q) :- object_loc(P, Q, Object), enemy(Object,_,_), print('E'), !.
printPetak(P,Q) :- object_loc(P, Q, Object), weapon(Object,_), print('W'), !.
printPetak(P,Q) :- object_loc(P, Q, Object), medicine(Object,_), print('M'), !.
printPetak(P,Q) :- print('-'), !.

/* Mekanisme gerakan pemain */
w :- position(X,Y), F is Y - 1, \+ object_loc(X,F,dz), retract(position(_,_)), countPlaytime, !, asserta(position(X,F)), print('You moved to the west.'), nl, !, movenemy, !.
w :- print('Do not move to the west or you will die!!'), nl, !.

e :- position(X,Y), F is Y + 1, \+ object_loc(X,F,dz), retract(position(_,_)), countPlaytime, !, asserta(position(X,F)), print('You moved to the east.'), nl, !, movenemy, !.
e :- print('Do not move to the east or you will die!!'), nl, !.

n :- position(X,Y), F is X - 1, \+ object_loc(F,Y,dz), retract(position(_,_)), countPlaytime, !, asserta(position(F,Y)), print('You moved to the north.'), nl, !, movenemy, !.
n :- print('Do not move to the nort or you will die!!'), nl, !.

s :- position(X,Y), F is X + 1, \+ object_loc(F,Y,dz), retract(position(_,_)), countPlaytime, !, asserta(position(F,Y)), print('You moved to the south.'), nl, !, movenemy, !.
s :- print('Do not move to the south or you will die!!'), nl, !.

countPlaytime :- playtime(T), T1 is T+1,
    retract(playtime(_)), asserta(playtime(T1)), setDeadzone, die, !.

setDeadzone :- playtime(T), F is T//20,
    X is 0+F, Y is 16-F,
    retract(object_loc(X,_,_)), retract(object_loc(_,Y,_)),
    asserta(object_loc(X,_,dz)), asserta(object_loc(_,Y,dz)),
	asserta(object_loc(_,X,dz)), asserta(object_loc(Y,_,dz)), !.


/* map - Menampilkan peta */

/* mekanisme menggunakan barang di inventory */
use(bandage) :-
	countPlaytime,
    in_inventory(bandage),
	inventory(L1),
	select(bandage, L1, L2),
	retractall(inventory(_)),
	asserta(inventory(L2)),
	health(H), H1 is H + 20,
	retract((_)), asserta((H1)), !.

use(firstaid) :-
	countPlaytime,
    in_inventory(firstaid),
	inventory(L1),
	select(firstaid, L1, L2),
	retractall(inventory(_)),
	asserta(inventory(L2)),
	health(H), H1 is H + 10,
	retract((_)), asserta((H1)), !.

use(millitaryVest) :-
	countPlaytime,
    in_inventory(millitaryVest),
	inventory(L1),
	select(millitaryVest, L1, L2),
	retractall(inventory(_)),
	asserta(inventory(L2)),
	jmlarmor(H), H1 is H + 30,
	retract((_)), asserta((H1)), !.

use(policeVest) :-
	countPlaytime,
    in_inventory(policeVest),
	inventory(L1),
	select(policeVest, L1, L2),
	retractall(inventory(_)),
	asserta(inventory(L2)),
	jmlarmor(H), H1 is H + 20,
	retract((_)), asserta((H1)), !.

use(X) :-
	countPlaytime,
    used_weapon(none),
	weapon(X,_),
	inventory(L1),
	select(X, L1, L2),
	retractall(inventory(_)),
	retract(used_weapon(_)), asserta(used_weapon(X)),
	asserta(inventory(L2)), !.

use(X) :-
	countPlaytime,
    in_inventory(X),
	weapon(X,_),
	inventory(L1),
	select(X, L1, L2),
	retractall(inventory(_)),
	used_weapon(W), retract(used_weapon(_)), asserta(used_weapon(X)),
	asserta(inventory([W|L2])), !.

use(pile) :-
	countPlaytime,
    in_inventory(pile),
	inventory(L1),
	select(pile, L1, L2),
	retractall(inventory(_)),
	asserta(inventory(L2)),
	jmlammo(H), H1 is H + 5,
	retract((_)), asserta((H1)), !.

use(dozen) :-
	countPlaytime,
    in_inventory(dozen),
	inventory(L1),
	select(dozen, L1, L2),
	retractall(inventory(_)),
	asserta(inventory(L2)),
	jmlammo(H), H1 is H + 12,
	retract((_)), asserta((H1)), !.

/* status - menampilkan keadaan player saat ini */
status :-
	health(H), print('Health: '), print(H), nl,
	used_weapon(W), print('Weapon: '), print(W), nl,
	jmlammo(A), print('Ammo : '), print(A), nl,
	inventory(L), print('Inventory : '), print(L), nl,
	enemy_num(E), print('Enemy left : '), print(E), nl,
	fail.

/*Kelola Inventory*/
/*in_inventory untuk ngecek apakah barangnya ada di inventory atau nggak*/
in_inventory(X):-
	inventory(L),
	member(X,L),!.
	
/*PutInInvent untuk taruh barang yang diambil ke dalam inventory*/
putInInvent(X,Y,Object):-
/*Masih ada tempat di inventory*/
	inventory(L),length(L,Z),inventory_cap(N),L<N,
	retract(inventory(_)),
	retract(object_loc(X,Y,Object)),
	print("Add "),print(Obejct),("to inventory."),nl,
	asserta(inventory(Object|L)),
	movenemy,
	countPlaytime,!.
/*Kasus inventory penuh*/
putInInvent(X,Y,Object):-
	inventory(L),length(L,Z),inventory_cap(N),L=N,
	print("Can't add the "),print(Object),print("to inventory."),nl,!.
	
/*Take(Object) untuk ambil object yang sepetak dengan player*/
take(Object):-
	/*Object=Enemy*/
	position(X,Y),object_loc(X,Y),enemy(Object,_,_),
	print("Can't invent the object. It's your enemy, attack it!"),!.
take(Object):-
	/*Object tepat*/
	position(X,Y),object_loc(X,Y),!,
	putInInvent(X,Y,Object).
take(Object):-
	/*else, Gaada object*/
	print("There's no any "),print(Object),print("detected"),!.

drop(Object) :-
	position(X,Y), in_inventory(Object),
	inventory(L1),
	select(Object, L1, L2),
	asserta(object_loc(X,Y, Object)),
	retractall(inventory(_)),
	asserta(inventory(L2)),
	print('Kamu meletakkan '), print(Object), movenemy, !.

/* Map */
map :- printMap(0,0), !.
/* Kasus khusus */
printMap(16,16) :- print('X'), !.
printMap(X,16) :- print('X'), nl, !, F is X+1, printMap(F, 0).
/* Kasus umum */
printMap(X,Y) :- position(X,Y), print('P'), !, F is Y+1, printMap(X,F).
printMap(X,Y) :- object_loc(X,Y, dz), print('X'), !, F is Y+1, printMap(X,F).
printMap(X,Y) :- object_loc(X,Y, Objek), enemy(Objek,_,_), print('E'), !, F is Y+1, printMap(X,F).
printMap(X,Y) :- print('-'), F is Y + 1, printMap(X,F).


/* command save */
save(Filename) :-
	telling(Old), tell(Filename),
	listing(object_loc/3), listing(position/2),
	listing(health/1), listing(jmlarmor/1),
	listing(jmlammo/1), listing(used_weapon/1), listing(weapon/2),
	listing(inventory/1), listing(inventory_cap/1), listing(enemy/3),
  listing(enemy_num/1), listing(playtime/1),
	told, tell(Old).

/* command load */
load(Filename) :-
	quit,
	seeing(Old),
	see(Filename),
	repeat,
	read(Data),
	process(Data),
	seen,
	print('File succesfully loaded'),
	see(Old),
	!.

process(end_of_file) :- !.
process(Data) :- asserta(Data), fail.

/* Menyerang musuh */
attack:- position(X,Y), at(X,Y, Name), enemy(Name,H,P), 
	used_weapon(none), weapon(W,A),
	print('You cannot attack, you dont have a weapon'),!.

/* Menyerang musuh */
attack:- position(X,Y), object_loc(X,Y, Name), enemy(Name,H,P), 
	used_weapon(none), weapon(W,A),
	print('You cannot attack, you dont have a weapon'),!.

attack:- position(X,Y), object_loc(X,Y, Name), enemy(Name,H,P), 
	used_weapon(W), weapon(W,A),
	H1 is H - A, retract(enemy(Name,H,P)),
	print(Name), print(' HP dropped to '), check_health(H1), nl,
	asserta(enemy(Name,H1,P)), checkdeath(Name),
	H1 > 0, retaliate(P), fail.

attack :- !.

check_health(A) :- A < 1, print('0'), !.
check_health(A) :- print(A), !.

/* Mekanisme kematian musuh */
checkdeath(X) :- enemy(X, A, _), A < 1, retract(enemy(X,_,_)),
	print(X), print(' is dead.'), nl,
	retract(at(_,_,X)), enemy_num(B), retract(enemy_num(_)), B1 is B - 1, asserta(enemy_num(B1)), checkvictory, !. 
checkdeath(A) :- !.

/* Kondisi menang */
checkvictory :- enemy_num(0), print('Congratulations, you win the game, you truly are the King of Knights!'), nl, quit, !.

/* Pergerakan musuh */
movenemy :- move_enemy(voldemort), move_enemy(bellatrix), move_enemy(inheritor), move_enemy(symbiote), move_enemy(madara), move_enemy(obito), move_enemy(sullivan), move_enemy(wazowski), move_enemy(oozmakappa), move_enemy(sousky), !.
move_enemy(Name) :- object_loc(A,B, Name), random(-1,1,X), C is A + X, C > 0, C < 16, retract(at(_,_,Name)), asserta(at(C,B, Name)), \+ C = A, !. 
move_enemy(Name) :- onject_loc(A,B, Name), random(-1,1,Y), C is B + Y, C > 0, C < 16, retract(at(_,_,Name)), asserta(at(A,C, Name)), !. 