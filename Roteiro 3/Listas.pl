% Exercicio 02
traducao(uno, um).
traducao(due, dois).
traducao(tre, tres).
traducao(quattro, quatro).
traducao(cinque, cinco).
traducao(sei, seis).
traducao(sette, sete).
traducao(otto, oito).
traducao(nove, nove).

/*
    Esse é o comportamento do predicado que devemos criar

    ?- traduz_lista([uno, nove, due], Pt).
    Pt = [um,nove,dois].

    ?- traduz_lista(It, [um, sete, seis, dois]).
    It = [uno,sette,sei,due].

*/
traduz_lista([H],[B]) :- traducao(H,B).
traduz_lista([H|T],[A|L]) :-
    traducao(H,A),
    traduz_lista(T,L).

% Exercicio 3
/*
    Esse é o comportamento do predicado que devemos criar

    ?- tresVezes([a, 4, bonde],X).
    X = [a,a,a,4,4,4,bonde,bonde,bonde].
    
    ?- tresVezes([1, 2, 1, 1],X).
    X = [1,1,1, 2,2,2, 1,1,1, 1,1,1].

    Dica: para responder a esta quest~ao, primeiro pergunte-se
    "O que deveria acontecer quando oprimeiro argumento é a lista vazia?". 
    Este e o caso base. 
    Para listas nao vazias, pense sobre o que voce deveria fazer com a cabeca e use recurs~ao para tratar a cauda.
*/
tresVezes([], []).
tresVezes([E|C],[E,E,E|T]) :-  tresVezes(C,T).

% Exercicio 4
/*
    Esse é o comportamento do predicado que devemos criar

    ?- intercala1([a,b,c],[1,2,3],X).
    X = [a,1,b,2,c,3]

    ?- intercala1([fu,ba,yip,yup],[glub,glab,glib,glob],Res).
    Res = [fu,glub,ba,glab,yip,glib,yup,glob]
*/
intercala1([],[],[]).
intercala1([E1|T1],[E2|T2], [E1,E2|T3]) :- intercala1(T1,T2,T3).

% Exercicio 5
/*    
    Agora escreva um predicado intercala2 que recebe tres listas como argumentos e intercala os elementos da duas primeiras listas gerando uma terceira. 
    
    Seguem alguns exemplos de uso:
    
    ?- intercala2([a,b,c],[1,2,3],X).
    X = [[a,1], [b,2], [c,3]]

    intercala2([fu,ba,yip,yup],[glub,glab,glib,glob],Res).
    Res = [[fu,glub], [ba,glab], [yip,glib], [yup,glob]]

*/
intercala2([],[],[]).
intercala2([E1|T1],[E2|T2], [[E1,E2]|T3]) :- intercala2(T1,T2,T3).

% Exercicio 6
intercala3([],[],[]).
intercala3([E1|T1],[E2|T2], [junta(E1,E2)|T3]) :- intercala3(T1,T2,T3).

% Exercicio 7
/*
    Lembrando da função de membros da lista.
        membro(X,[X|_]).
        membro(X,[_|T]) :- membro(X,T).

    Agora o comportamento esperado do predicado da questão:

    ?- subconjunto([3,1], [4,1,9,8,3]).
    true
    ?- subconjunto([a,b], [b, d, e, f]).
    false

    Compara A com toda a lista,
    Depois B com toda a lista,
    
    NÃO SE PODE PERDER A LISTA DOS SUBCONJUNTOS.
*/
membro(X,[X|_]).
membro(X,[_|T]) :- membro(X,T).

subconjunto([],_).
subconjunto([H|T], L) :- membro(H,L), subconjunto(T,L).

% Exercicio 8
/*
    Escreva um predicado superconjunto/2 que recebe duas listas (de constantes) com argumentos e verifica se a primeira lista é um cuperconjunto da segunda.
    Esse é o comportamento esperado do predicado que vamos criar.

    ?- superconjunto([4,1,9,8,3], [3,1]).
    true
    ?- superconjunto([b,d,e,f], [a,b]).
    false
    ?- superconjunto([a,f,b,e], [a,b,e,f]).
    true
*/
superconjunto([H|T], L) :- subconjunto(L,[H|T]).

% Exercicio 9
/*
    duplicada(Lista)
    usar concatena.

    como é o predicado concatena?

    L1,L2,L3

    L1++L2 = L3

    Adiciona a cabeça de L1 a L3 e coloca L2 ao final    
*/
concatena([],L2,L2).
concatena([L1|L1s],L2,[L1|L3]) :-
    concatena(L1s,L2,L3).

duplicada(L) :- concatena(L1,L1,L).

/*
    Exercicio 10

    Palindromo.
*/

palindromo([]).
palindromo([_]).
palindromo([H|T]) :-
    concatena(Resto,[H],T),
    palindromo(Resto).

/*
    Exercicio 11
    dıgitos/2 cujo primeiro argumento e um numero natural N e o segundo
argumento e uma lista contendo os dıgitos de N.

    Usar acumulador, para evitar ter q inverter a lista.

    ?- dıgitos(451, Ds).
    Ds = [4, 5, 1]

    ?- dıgitos(209, Ds).
    Ds = [2, 0, 9]

*/
digitosAcm(0,Acm,Acm) :- !.
digitosAcm(N,Acm,Res) :-
    H is mod(N,10),
    N1 is N//10,
    digitosAcm(N1,[H|Acm],Res).

digitos(N, Res) :- digitosAcm(N,[],Res).

% Exercicio 12
tradutor(0, zero).
tradutor(1, um).
tradutor(2, dois).
tradutor(3, tres).
tradutor(4, quatro).
tradutor(5, cinco).
tradutor(6, seis).
tradutor(7, sete).
tradutor(8, oito).
tradutor(9, nove).

palavra([],[]).
palavra([X|T],[Y|Z]) :- tradutor(X,Y), palavra(T,Z).

digitos_em_palavras(N, Ps) :-
    digitosAcm(N,[],Digitos), 
    palavra(Digitos,Ps).

% Exercicio 13
accRev([],Acc,Acc).
accRev([H|T], Acc, Res) :- accRev(T,[H|Acc], Res).

rev(L,Rl) :- accRev(L,[],Rl).

dec_para_bin2(0,[]):-!.
dec_para_bin2(N,[Resto|T]) :-
    Resto is mod(N,2),
    Quociente is N//2,
    dec_para_bin2(Quociente,T).

dec_para_bin(N,Lista) :- 
    dec_para_bin2(N,Lista_invertida),
    rev(Lista_invertida,Lista).

% Exercicio 14
bin_para_dec([],Ac,Ac):-!.
bin_para_dec([H|Hs],S, Dec):-
    S1 is S*2,
    S2 is S1+H,
    bin_para_dec(Hs,S2,Dec).

bin_para_dec(L,D) :- bin_para_dec(L,0,D).


/*
    Exercicio 15
    ?- pares([1, 2, 6, 7, 4], X).
    X = [2,6,4].
*/
pares([],[]).
pares([H|T],Lp) :- N is mod(H,2), 0 =\= N, pares(T,Lp).
pares([H|T],[H|Lp]) :- N is mod(H,2), 0 =:= N, pares(T,Lp).

/*
    Exercicio 16
    ?- multiEsc(3,[2,7,4],Resultado).
    Resultado = [6,21,12]
*/
multiEsc(_,[],[]).
multiEsc(N,[H|T],[N1|Res]) :-
    N1 is H*N,
    multiEsc(N,T,Res).

/*
    Exercicio 17
    ?- prodEsc([2,5,6],[3,4,1],Resultado).
    Resultado = 32
*/
prodEsc([],[],0).
prodEsc([H1|T1], [H2|T2], Res) :-
        Res1 is H1*H2,
        prodEsc(T1,T2,Res2),
        Res is Res1 + Res2.

/*
    Exercicio 18

    Remove a primeira ocorrência do elemento X na lista L, resultando na lista L1.

    ?- remove(a,[a,b,a,c,a],L).
    L = [b, a, c, a] ;
    L = [a, b, c, a] ;
    L = [a, b, a, c] ;
    false.
    
*/
remove(H,[H|T],T).
remove(H,[G|T],[G|Res]) :- remove(H,T,Res).

/*
    Exercicio 19

    Usando o predicado remove/3 (Ex. 18) -> Criar insere(X,L,L1).
    insere um elemento X em alguma posicao da lista L

    ?- insere(a,[b,c,d],L).
    L = [a, b, c, d] ;
    L = [b, a, c, d] ;
    L = [b, c, a, d] ;
    L = [b, c, d, a] ;
    false.
*/
insere(X,L,L1) :- remove(X,L1,L).

% Exercicio 20
permutacao([],[]).
permutacao(Xs,[Y|Zs]):-
    remove(Y,Xs,Ys),
    permutacao(Ys,Zs).

% Comentarios das chamadas do Exercicio 20
/*
    Quais os anagramas da palavra amor?

    Anagramas - transposição de letras de palavra ou frase para formar outra palavra ou frase diferente.

    Assim se pensa em permutação.

    ?- permutacao([a,m,o,r],X).

    ?- permutacao([carlos,rose,sergio,adriano,fabiola], Fotos).
*/

% Exercicio 21
/*
    Ps(m) = m!

    num_permutacoes(M,N) :- fatorial(M,N).

    necessaria a func fatorial.

    fatorial(1,1):-!
    fatorial(N,M) :-
        N1 is N-1,
        M is N*M1,
        factorial(N1,M1).

*/
fatorial(0,1):-!.
fatorial(N,M) :-
    N1 is N-1,
    fatorial(N1,M1),
    M is N*M1.

num_permutacoes(M,Res) :- fatorial(M,Res).

combinacao(0,_,[]).
combinacao(N,[X|Xs],[X|Ys]):- N>0,
    N1 is N - 1,
    combinacao(N1,Xs,Ys).

combinacao(N,[_|Xs], Ys):- N>0,
    combinacao(N,Xs,Ys).

% Exercicio 22 - a) ?- combinacao(5,[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10],Equipes).

% Exercicio 22 - b) -> Como somar? seria a mistura dos matematicos com os professores da computação.

% Exercicio 23  num_combinacoes(M,P,N)
% Formula = m! / (m-p)!*P!

num_combinacoes(M,P,Res) :-
    fatorial(M,Mfac),
    fatorial(P,Pfac),
    MP is M - P,
    fatorial(MP,MPfac),
    Res is Mfac / (MPfac * Pfac).

% Exercicio 24 -> Criar Arranjo
/*
    Comportamento esperado
    ?- arranjo(2, [a,b,c,d], A).
    A = [a, b] ;
    A = [a, c] ;
    A = [a, d] ;
    A = [b, a] ;
    A = [b, c] ;
    A = [b, d] ;
    A = [c, a] ;
    A = [c, b] ;
    A = [c, d] ;
    A = [d, a] ;
    A = [d, b] ;
    A = [d, c] ;
    false.

    REFERENCIA:
    permutacao([],[]).
    permutacao(Xs,[Y|Zs]):-
        remove(Y,Xs,Ys),
        permutacao(Ys,Zs).

    combinacao(0,_,[]).
    combinacao(N,[X|Xs],[X|Ys]):- N>0,
        N1 is N - 1,
        combinacao(N1,Xs,Ys).

    combinacao(N,[_|Xs], Ys):- N>0,
        combinacao(N,Xs,Ys).
        
*/
arranjo(0,_,[]):-!.
arranjo(N,Xs,[Y|Zs]) :-
    N > 0,
    N1 is N-1,
    remove(Y,Xs,Ys),
    arranjo(N1,Ys,Zs).

/*
    Exercicio 25: 
    a) arranjo(3,[1,2,3,4,5,7], Algarismos).

    b) arranjo(3,[1,2,3,4,5,6,7,8], Podio),
*/

/*
    Exercicio 26:

    num_arranjos(M,P,N)

    Formula: A(m,p) = fac(M)/fac(MP)

    RELEMBRANDO
    num_combinacoes(M,P,Res) :-
        fatorial(M,Mfac),
        fatorial(P,Pfac),
        MP is M - P,
        fatorial(MP,MPfac),
        Res is Mfac / (MPfac * Pfac).

*/
num_arranjos(M,P,N) :-
    fatorial(M,Mfac),
    MP is M - P,
    fatorial(MP,MPfac),
    N is Mfac/MPfac.