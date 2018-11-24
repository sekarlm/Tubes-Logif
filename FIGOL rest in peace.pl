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
    assert(position(5,5)),
    assert(health(100)),
    assert(used_weapon(none)),
    assert(inventory([])),
    assert(inventory_cap(5)),
    /* Fakta peta */
    /* Deskripsi peta : */
    /* -- Petak - petak pada peta dapat diakses dengan koordinat (x,y) */
    /* -- Ukuran peta 15 x 15 */
    /* Fakta objek-objek dalam permainan */
    /* -- weapon(jenis,attack_power) -- */
    assert(weapon(awm,20)),
    assert(weapon(groza,18)),
    assert(weapon(ak47,17),
    assert(weapon(firegun,15)),
    assert(weapon(kashu,14)),
    assert(weapon(shushui,11)),
    assert(weapon(katana,8)),
    assert(weapon(bayonet,7)),
    assert(weapon(karambit,5)),
    assert(weapon(machette,3)),
    /* -- medicine(jenis,recovery_power) --/
    assert(medicine(holyWater,20)),
    assert(medicine(antidote,10)),
    /* Lokasi objek di peta */
    assert(location(11,7,awm)),
    assert(location(5,7,awm)),
    assert(location(8,2,groza)),
    assert(location(13,5,groza)),
    assert(location(6,8,ak47)),
    assert(location(7,12,ak47)),
    assert(location(11,9,firegun)),
    assert(location(2,11,firegun)),
    assert(location(10,10,kashu)),
    assert(location(5,3,kashu)),
    assert(location(9,14,shushui)),
    assert(location(3,8,katana)),
    assert(location(4,6,katana)),
    assert(location(13,12,bayonet)),
    assert(location(7,3,bayonet)),
    assert(location(11,9,karambit)),
    assert(location(4,7,karambit)),
    assert(location(8,5,machette)),
    assert(location(6,1,machette)),
    assert(location(9,6,antidote)),
    assert(location(7,7,antidote)),
    assert(location(3,9,antidote)),
    assert(location(4,7,antodote)),
    assert(location(10,8,antidote)),
    assert(location(5,7,holyWater)),
    assert(location(8,6,holyWater)),
    assert(location(3,11,holyWater)),
    assert(location(10,7,holyWater)),
    assert(location(9,8,holyWater)),
    assert(location(7,8,holyWater)),
    /* Fakta musuh */
    assert(enemy_num(10)), /* jumlah musuh */
    /* -- enemy(jenis,health,attack_power) -- */
    assert(enemy(voldemort,40,15)),
    assert(enemy(bellatrix,40,12)),
    assert(enemy(inheritor,40,11)),
    assert(enemy(symbiote,40,9)),
    assert(enemy(madara,40,8)),
    assert(enemy(obito,40,8)),
    assert(enemy(sullivan,40,7)),
    assert(enemy(wazowski,40,6)),
    assert(enemy(oozmakappa,40,6)),
    assert(enemy(sousky,40,5)).

/* Aturan Penalaran */
/* start -- untuk memulai permainan */
start :- 
    retract(location(_,_,_)), retract(position(_,_)),
    retract(health(_)), retract(used_weapon(_)),
    retract(weapon(_)), retract(inventory(_)), retract(enemy_num(_)),
    assert(location(0,_,dz)), /* dz : deadzone */
    assert(location(16,_,dz)),
    assert(location(_,0,dz)),
    assert(location(_,16,dz)),
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
    retract(location(_,_,_)), retract(position(_,_)),
    retract(health(_)), retract(used_weapon(_)),
    retract(weapon(_)), retract(inventory(_)), retract(enemy_num(_)).