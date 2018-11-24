/* Tugas Besar Logif */
/* Kelompok Kok ada tubes? */
/* 1. M Nobel Fauzan    - 13517--- */
/* 2. Vinsen Marsellino - 13517--- */
/* 3. Sekar Larasati M  - 13517--- */
/* 4. Nurul Utami A W   - 13517--- */

/* predikat dinamik */
:- dynamic(object_loc/2). /* lokasi objek */
:- dynamic(posisition/2). /* posisi player */
:- dynamic(health/1).
:- dynamic(used_weapon/1).
:- dynamic(weapon/2).
:- dynamic(inventory/1).
:- dynamic(inventory_cap/1). /* kapasitas inventory */
:- dynamic(enemy/3).
:- dynamic(enemy_num/1).
:- dymanic(medicine/2).

init :-
    /* Fakta pemain */
    asserta(position(5,5)),
    asserta(health(100)),
    asserta(used_weapon(none)),
    asserta(inventory([])),
    asserta(inventory_cap(5)),
    /* Fakta peta */
    /* Deskripsi peta : */
    /* -- Petak - petak pada peta dapat diakses dengan koordinat (x,y) */
    /* -- Ukuran peta 15 x 15 */
    /* Fakta objek-objek dalam permainan */
    /* -- weapon(jenis,attack_power) -- */
    asserta(weapon(awm,20)),
    asserta(weapon(groza,18)),
    asserta(weapon(ak47,17),
    asserta(weapon(firegun,15)),
    asserta(weapon(kashu,14)),
    asserta(weapon(shushui,11)),
    asserta(weapon(katana,8)),
    asserta(weapon(bayonet,7)),
    asserta(weapon(karambit,5)),
    asserta(weapon(machette,3)),
    /* -- medicine(jenis,recovery_power) --/
    asserta(medicine(holyWater,20)),
    asserta(medicine(antidote,10)),
    /* Lokasi objek di peta */
    asserta(location(11,7,awm)),
    asserta(location(5,7,awm)),
    asserta(location(8,2,groza)),
    asserta(location(13,5,groza)),
    asserta(location(6,8,ak47)),
    asserta(location(7,12,ak47)),
    asserta(location(11,9,firegun)),
    asserta(location(2,11,firegun)),
    asserta(location(10,10,kashu)),
    asserta(location(5,3,kashu)),
    asserta(location(9,14,shushui)),
    asserta(location(3,8,katana)),
    asserta(location(4,6,katana)),
    asserta(location(13,12,bayonet)),
    asserta(location(7,3,bayonet)),
    asserta(location(11,9,karambit)),
    asserta(location(4,7,karambit)),
    asserta(location(8,5,machette)),
    asserta(location(6,1,machette)),
    asserta(location(9,6,antidote)),
    asserta(location(7,7,antidote)),
    asserta(location(3,9,antidote)),
    asserta(location(4,7,antodote)),
    asserta(location(10,8,antidote)),
    asserta(location(5,7,holyWater)),
    asserta(location(8,6,holyWater)),
    asserta(location(3,11,holyWater)),
    asserta(location(10,7,holyWater)),
    asserta(location(9,8,holyWater)),
    asserta(location(7,8,holyWater)),
    /* Fakta musuh */
    asserta(enemy_num(10)), /* jumlah musuh */
    /* -- enemy(jenis,health,attack_power) -- */
    asserta(enemy(voldemort,40,15)),
    asserta(enemy(bellatrix,40,12)),
    asserta(enemy(inheritor,40,11)),
    asserta(enemy(symbiote,40,9)),
    asserta(enemy(madara,40,8)),
    asserta(enemy(obito,40,8)),
    asserta(enemy(sullivan,40,7)),
    asserta(enemy(wazowski,40,6)),
    asserta(enemy(oozmakappa,40,6)),
    asserta(enemy(sousky,40,5)).

/* Aturan Penalaran */
/* start -- untuk memulai permainan */
start :- 
    retracall(location(_,_,_)), retracall(position(_,_)),
    retracall(health(_)), retracall(used_weapon(_)),
    retracall(weapon(_)), retracall(inventory(_)), retracall(enemy_num(_)),
    asserta(location(0,_,dz)), /* dz : deadzone */
    asserta(location(16,_,dz)),
    asserta(location(_,0,dz)),
    asserta(location(_,16,dz)),
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
    write('Left the bettlefield'), nl,
    retracall(location(_,_,_)), retracall(position(_,_)),
    retracall(health(_)), retracall(used_weapon(_)),
    retracall(weapon(_)), retracall(inventory(_)), retracall(enemy_num(_)).