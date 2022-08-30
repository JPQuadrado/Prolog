conectado(1,2).
conectado(3,4).
conectado(5,6).
conectado(7,8).
conectado(9,10).
conectado(12,13).
conectado(13,14).
conectado(15,16).
conectado(17,18).
conectado(19,20).
conectado(4,1).
conectado(6,3).
conectado(4,7).
conectado(6,11).
conectado(14,9).
conectado(11,15).
conectado(16,12).
conectado(14,17).
conectado(16,19).

% caminho/2
caminho(X,Y) :- conectado(X,Y).
caminho(X,Y) :- conectado(X,Z), caminho(Z,Y).

/*
    ?- caminho(5,10).
        true .

    ?- caminho(1,Y).
        Y = 2 ;
        false.

    ?- caminho(13,Y).
        Y = 14 ;
        Y = 9 ;
        Y = 17 ;
        Y = 10 ;
        Y = 18 ;
        false.

*/