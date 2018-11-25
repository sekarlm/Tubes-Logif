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
:- dynamic(used_weapon/1).
:- dynamic(weapon/2).
:- dynamic(inventory/1).
:- dynamic(enemy/3).
:- dynamic(enemy_num/1).
:- dynamic(medicine/2).

init :-
    /* Fakta pemain */
    /* Setting awal player */
    asserta(position(7,8)), /* posisi awal player pada petak (7,8) */
    asserta(health(100)),
    asserta(used_weapon(none)),
    asserta(inventory([])),
    asserta(inventory_cap(5)), /* kapasitas maksimum inventory adalah 5 */
    /* Fakta peta */
    /* Deskripsi peta : */
    /* -- Petak - petak pada peta dapat diakses dengan koordinat (x,y) */
    /* -- Ukuran peta 15 x 15 */
    /* Fakta objek-objek dalam permainan */
    /* -- weapon(jenis,attack_power) -- */
    asserta(weapon(awm, 20)),
    asserta(weapon(groza, 18)),
    asserta(weapon(ak47, 17),
    asserta(weapon(firegun, 15)),
    asserta(weapon(kashu, 14)),
    asserta(weapon(shushui, 11)),
    asserta(weapon(katana, 8)),
    asserta(weapon(bayonet, 7)),
    asserta(weapon(karambit, 5)),
    asserta(weapon(machette, 3)),
    asserta(weapon(none, 0)),
    /* -- medicine(jenis,recovery_power) --/
    asserta(medicine(holyWater, 20)),
    asserta(medicine(antidote, 10)),
    /* Lokasi objek di peta */
    /* -- weapon -- */
    asserta(object_loc(11, 7, awm)),
    asserta(object_loc(5, 7, awm)),
    asserta(object_loc(8, 2, groza)),
    asserta(object_loc(13, 5, groza)),
    asserta(object_loc(6, 8, ak47)),
    asserta(object_loc(7, 12, ak47)),
    asserta(object_loc(11, 9, firegun)),
    asserta(object_loc(2, 11, firegun)),
    asserta(object_loc(10, 10, kashu)),
    asserta(object_loc(5, 3, kashu)),
    asserta(object_loc(9, 14, shushui)),
    asserta(object_loc(3, 8, katana)),
    asserta(object_loc(4, 6, katana)),
    asserta(object_loc(13, 12, bayonet)),
    asserta(object_loc(7, 3, bayonet)),
    asserta(object_loc(11, 9, karambit)),
    asserta(object_loc(4, 7, karambit)),
    asserta(object_loc(8, 5, machette)),
    asserta(object_loc(6, 1, machette)),
    /* -- medicine -- */
    asserta(object_loc(9, 6, antidote)),
    asserta(object_loc(7, 7, antidote)),
    asserta(object_loc(3, 9, antidote)),
    asserta(object_loc(4, 7, antodote)),
    asserta(object_loc(10, 8, antidote)),
    asserta(object_loc(5, 7, holyWater)),
    asserta(object_loc(8, 6, holyWater)),
    asserta(object_loc(3, 11, holyWater)),
    asserta(object_loc(10, 7, holyWater)),
    asserta(object_loc(9, 8, holyWater)),
    asserta(object_loc(7, 8, holyWater)),
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
look :- cekAntidote, fail.
look :- cekholyWater, fail.
look :- cekWeapon, fail.
look :- printMap3x3, !, !.
/* rule terkait command look */
cekEnemy :- 
    position(X,Y), object_loc(X,Y, Name), enemy(Name,_,_), write('You see '), write(Name), write('in front of you!'), nl, fail.
cekEnemy :- !.
cekAntidote :-
    position(X,Y), object_loc(X,Y, antidote), write('You see antidote lying in the ground!'), nl, !.
cekholyWater :-
    position(X,Y), object_loc(X,Y, antidote), write('You see holyWater lying in the ground!'), nl, !.
cekWeapon :-
    position(X,Y), object_loc(X,Y, Name), weapon(Name,_), typeofweapon(Name), !.
/* rule untuk menentukan jenis weapon */
typeofweapon(Name) :- Name = awm, write('You see an awm lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = groza, write('You see a groza lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = ak47, write('You see an ak47 lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = firegun, write('You see a firegun lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = kashu, write('You see a kashu lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = shushui, write('You see a shushui lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = katana, write('You see a katana lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = bayonet, write('You see a bayonet lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = karambit, write('You see a karambit lying in the ground!'), nl, !.
typeofweapon(Name) :- Name = machette, write('You see a machette lying in the ground!'), nl, !.
printMap3x3 :- 
    position(X,Y),
    Xmin is X-1, Xplus is X+1, Ymin is Y-1, Yplus is Y+1,
    printPetak(Xmin,Ymin), printPetak(Xmin,Y), printPetak(Xmin,Yplus), nl,
    printPetak(X,Ymin), print('P'), printPetak(X,Yplus), nl,
    printPetak(Xplus,Ymin), printPetak(Xplus,Y), printPetak(Xplus,Yplus), !.
/* rule printPetak */
printPetak(P,Q) :- object_loc(A, B, dz), print('X'), !.
printPetak(P,Q) :- object_loc(A, B, Object), enemy(Object,_,_), print('E'), !.
printPetak(P,Q) :- object_loc(A, B, Object), weapon(Object,_), print('W'), !.
printPetak(P,Q) :- object_loc(A, B, Object), medicine(Obejct,_), print('M'), !.
printPetak(P,Q) :- print('-'), !.

/* Mekanisme Gerak Player */

/* Menetapkan lokasi awal musuh di peta */
setenemy :-
    random(1,10,X), random(1,10,Y), asserta(object_loc(X,Y, voldemort)),
    random(1,10,X1), random(1,10,Y1), asserta(object_loc(X1,Y1, bellatrix)),
    random(1,10,X2), random(1,10,Y2), asserta(object_loc(X2,Y2, inheritor)),
    random(1,10,X3), random(1,10,Y3), asserta(object_loc(X3,Y3, symbiote)),
    random(1,10,X4), random(1,10,Y4), asserta(object_loc(X4,Y4, obito)),
    random(1,10,X5), random(1,10,Y5), asserta(object_loc(X5,Y5, madara)),
    random(1,10,X6), random(1,10,Y6), asserta(object_loc(X6,Y6, sullivan)),
    random(1,10,X7), random(1,10,Y7), asserta(object_loc(X7,Y7, wazowski)),
    random(1,10,X8), random(1,10,Y8), asserta(object_loc(X8,Y8, oozmakappa)),
    random(1,10,X9), random(1,10,Y9), asserta(object_loc(X9,Y9, sousky)).
    