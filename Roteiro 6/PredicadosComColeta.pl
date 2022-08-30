pais(alemanha, europa, 83, [franca, belgica, holanda, suica]).
pais(australia, oceania, 25, []).
pais(belgica, europa, 11, [franca, holanda, alemanha]).
pais(espanha, europa, 47, [portugal, franca]).
pais(franca, europa, 67, [espanha, suica, belgica, alemanha,
italia]).
pais(holanda, europa, 17, [belgica, alemanha]).
pais(indonesia, oceania, 268, []).
pais(italia, europa, 60, [franca, suica]).
pais(madagascar, africa, 26, []).
pais(portugal, europa, 10, [espanha]).
pais(suica, europa, 8, [franca, alemanha, italia]).

%   Exercicio 01
crescente([],[]). %Tem q fazer do 0?

pop_elevada(A,B) :- 
    setof(J-K,((A,H)^(pais(K,A,J,H),J > 15)),B). % falta ordenar.
/*
    ?- pop_elevada(europa,Lista).
    Lista = [83-alemanha, 47-espanha, 67-franca, 17-holanda, 60-italia].

    ?- pop_elevada(africa,Lista).
    Lista = [26-madagascar].
*/

/*   Exercicio 02
isolados_grandes(Lista) :-
    setof(Continente,((Vizinhos)^(pais(Pais,Continente,Pop,Vizinhos),Pop>15)),Lista).
*/
paises_grandes(Continente,Lista) :-
    setof(Nome,Pop^Fronteiras^N^(
            pais(Nome, Continente, Pop, Fronteiras),
            Pop > 15,length(Fronteiras, N), N < 3 ),
            Lista).

isolados_grandes(Lista) :-
    setof(Continente,
        Paises^N^(paises_grandes(Continente,Paises),
        length(Paises,N), N > 1 ),
        Lista).

%   Exercicio 03
q(blob,blug).
q(blob,blag).
q(blob,blig).
q(blaf,blag).
q(dang,dong).
q(dang,blug).
q(flab,blob).
/*
    a) findall(X,q(blob,X), Lista).
    Lista = [blug, blag, blig].

    b) findall(X,q(X,blug), Lista).
    Lista = [blob, dang].

    c) findall(X,q(X,Y), Lista).
    Lista = [blob, blob, blob, blaf, dang, dang, flab].

    d) bagof(X,q(X,Y), Lista).
    Y = blag,
    Lista = [blob, blaf] ;
    Y = blig,
    Lista = [blob] ;
    Y = blob,
    Lista = [flab] ;
    Y = blug,
    Lista = [blob, dang] ;
    Y = dong,
    Lista = [dang].

    e) setof(X,Y^q(X,Y), Lista).
    Lista = [blaf, blob, dang, flab].
*/

%   Exercicio 04
idade(pedro, 8).
idade(ana, 5).
idade(paula, 8).
idade(ricardo,10).
idade(carla,5).
idade(amanda,12).
idade(sara,15).
idade(debora,14).
idade(joaquim,12).
idade(gabriel,5).

/*
    a) findall(Pessoa,idade(Pessoa,5),Lista).

    ?- findall(Pessoa,idade(Pessoa,5),Lista).
    Lista = [ana, carla, gabriel].

    b) setof(Idade, idade(_,Idade), Lista). #####

    c) findall(Nome, idade(Nome,_), Lista).

    ?- findall(Nome, idade(Nome,_), Lista).
    Lista = [pedro,ana,paula,ricardo,carla,amanda,sara,debora,joaquim,gabriel].

    d) findall(Nome,(idade(Nome,J), J>=8, J=<12),Lista)

    ?- findall(Nome,(idade(Nome,J), J>=8, J=<12),Lista).
    Lista = [pedro,paula,ricardo,amanda,joaquim].
*/

%   Exercicio 05 +-
/*
    [trace]  ?- subconjunto([c,b],[a,b,c]).
    Call: (10) subconjunto([c, b], [a, b, c]) ? creep
    Call: (11) subconjunto([c, b], [b, c]) ? creep
    Call: (12) subconjunto([c, b], [c]) ? creep
    Call: (13) subconjunto([b], []) ? creep
    Fail: (13) subconjunto([b], []) ? creep
    Redo: (12) subconjunto([c, b], [c]) ? creep
    Call: (13) subconjunto([c, b], []) ? creep
    Fail: (13) subconjunto([c, b], []) ? creep
    Fail: (12) subconjunto([c, b], [c]) ? creep
    Fail: (11) subconjunto([c, b], [b, c]) ? creep
    Fail: (10) subconjunto([c, b], [a, b, c]) ? creep
    false.

    ACHA O C, MAS NA HORA DE VOLTA ELE N PROCURA O B COM A LISTA COMPLETA.

    ?- subconjunto(S,[a,b,c]).
    S = [] ;
    S = [a] ;
    S = [a, b] ;
    S = [a, b, c] ;
    S = [a, c] ;
    S = [b] ;
    S = [b, c] ;
    S = [c] ;
    false.

    Lista tá bem imcompleta, porque???
*/

subconjunto([],_).
subconjunto([H|T],[H|T1]) :-
    subconjunto(T,T1).
subconjunto([H|T],[Z|T1]) :-
    subconjunto([H|T],T1),
    subconjunto(T,[Z|T]).

% Procura predicado select.
subconjunto_select([],_).
subconjunto_select([H|T],L2) :-
    select(H,L2,L),
    subconjunto_select(T,L).

/*
    ?- subconjunto_select(S,[a,b,c]).
    S = [] ;
    S = [a] ;
    S = [a, b] ;
    S = [a, b, c] ;
    S = [a, c] ;
    S = [a, c, b] ;
    S = [b] ;
    S = [b, a] ;
    S = [b, a, c] ;
    S = [b, c] ;
    S = [b, c, a] ;
    S = [c] ;
    S = [c, a] ;
    S = [c, a, b] ;
    S = [c, b] ;
    S = [c, b, a] ;
    false
*/


% Exercicio 6

conj_potencia([],[]).
conj_potencia(Conj, Respota):-
    bagof(Lista,subconjunto_select(Lista,Conj),Respota).
% Nesse exercicio na saida nem é esperado o [c,b] que deveria ter dado verdadeiro.
