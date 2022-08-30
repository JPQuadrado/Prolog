principal:- 
    open('arq.txt',read,F),
    %Lembrar do comando pwd e cd.
    leiaPalavra(F,Palavra),
    close(F).

%Falta leia palavras.
leiaPalavra(Fluxo,Palavra):-
    get_code(Fluxo,Caracter),
    verificaELeiaResto(Caracter,Caracteres,Fluxo),
    atom_codes(Palavra,Caracteres),
    write(Palavra),nl.
    
verificaELeiaResto(10, [], _):- !.
verificaELeiaResto(32, [], _):- !.
verificaELeiaResto(-1, [], _):- !. 

verificaELeiaResto(Caracter,[Caracter|Caracteres],F):-
    get_code(F,ProxCaracter),
    verificaELeiaResto(ProxCaracter,Caracteres,F).