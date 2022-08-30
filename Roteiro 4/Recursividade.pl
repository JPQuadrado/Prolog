/*
    Exercicio 1
    soma_acm(L,K),

    Dado uma lista, soma os elementos de L até tal posição. E retorna tal Lista K

    ?- soma_acum([1,2,3,4],K).
    K = [1,3,6,10].
*/
somaAC([],_,[]).
somaAC([X|Xs],[A|T],[Acc|L]) :-
    Acc is A+X,
    somaAC(Xs,[Acc|T],L).

soma_acum(L,K) :- somaAC(L,[0],K).

/*
    Exercicio 2

    ?- soma_ate(5,S).
    S = 15.

    Soma de 1 até 5.
    1+2+3+4+5 = 15 = S
*/
soma_ate(0,0):-!.
soma_ate(N,Sum) :-
    N1 is N-1,
    soma_ate(N1,S1),
    Sum is S1 + N.

/*
    Exercicio 3:

    sem_repeticao(L1,L2) -> L2 é L1 tendo removido todos os elementos repetidos.

    ?- sem_repeticao([a,b,c,b], [a,c,b]).
    true

    Use member/2.
*/

sem_repeticao([],[]).
sem_repeticao([X|Xs], Ys) :-
    member(X,Xs),!,
    sem_repeticao(Xs,Ys).

sem_repeticao([X|Xs], [X|Ys]) :- sem_repeticao(Xs,Ys).

/*
    Exercicio 4:
    Segmento continuo? FAZER ARVORE
    
    [a,b,c] - [1,5,8,a,b,c,8]
    quando encontro a, tiro de ambos
    vou pro proximo,
    se a lista 2 acaba e a 1 ta la, é false.
*/
segmento([],_).
segmento(X,Y) :-
    append(X,_,Y).
segmento(X,[_|Ys]) :-
    segmento(X,Ys).

%   Exercicio 5 - separa_dup(L,D)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


/*
    Exercicio 6

    ?- replica([a, b, c], 4, R).
    R = [a, a, a, a, b, b, b, b, c, c, c, c]

*/
    gerar_lista(0, _, []).
    gerar_lista(N, E, [E|T]) :- 
        N1 is N - 1,
        gerar_lista(N1, E, T), !.

    replica([], _, []).
    replica([H|T], N, R) :-
        gerar_lista(N, H, L2),
        append(L2, T1, R),
        replica(T, N, T1).

/*
    Exercicio 7

    ?- bissexto(2021).
    false
    ?- bissexto(2000).
    true
    ?- bissexto(2004).
    true
    ?- bissexto(1900).
    false
*/
test_4(X) :- 
    X1 is mod(X,4),
    X1 =:= 0.
test_100(X) :- 
    X1 is mod(X,100),
    X1 =:= 0.
test_400(X) :-
    X1 is mod(X,400),
    X1 =:= 0.

bissexto(X) :-
    (test_4(X), test_100(X), test_400(X),!);
    (test_4(X), \+test_100(X)).

/*
    Exercicio 8
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ?- romano(21, R).
    R = ['X', 'X', 'I']
    ?- romano(800, R).
    R = ['D', 'C', 'C', 'C']
    ?- romano(2021, R).
    R = ['M', 'M', 'X', 'X', 'I']

    Decimal -> Romano

    Os Números Romanos são compostos por 7 símbolos: 
    I (1), V (5), X (10), L (50), C (100), D (500) e M (1000).

    N > 0.
*/
num(1,'I').
num(5,'V').
num(10,'X').
num(50,'L').
num(100,'C').
num(500,'D').
num(1000,'M').

%   Exercicio 9)a)
membro(H,[H|_]).
membro(H,[_|T]) :- membro(H,T).

disjunto(L1,L2) :-
    \+
    (membro(H,L1),
    membro(H,L2)).

/*
    Exercicio 9)b)
    uniao(L,K,M) e verdadeiro se, e somente se, M e a uniao de L e K.
*/
uniao([],[],_).
uniao([A|As],[B|Bs],AB) :-
    (\+member(A,[B|Bs]),\+member(B,[A|As])),
    (member(A,AB),member(B,AB)),    
    uniao(As,Bs,AB).

/*
    Exercicio 9)c)
    intersecao(L,K,M) e verdadeiro se, e somente se, M e a intersecao de L e K.
*/
intersecao(_,_,[]):-!.
intersecao(L1,L2,[M|Ms]) :- 
    (member(M,L1),member(M,L2)),
    intersecao(L1,L2,Ms).

/*
    Exercicio 9)d)
    diferenca(L,K,M) e verdadeiro se, e somente se, M e a diferenca entre L e K.
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diferenca(_,_,[]).
diferenca(L1,L2,[H|T]) :-
    member(H,L1),
    \+member(H,L2),
    diferenca(L1,L2,T).

/*
    Exercicio 10

    Defina um predicado ocorrencias(X,L,N) que e verdadeiro se, e somente se, X ocorre N vezes na lista L.
*/
ocorrencias(X,0,[]).
ocorrencias(X,N,[X|L]) :-
    ocorrencias(X,N1,L),
    N is N1 + 1,!.
ocorrencias(X,N,[Y|L]) :- ocorrencias(X,N,L).

/*
    Exercicio 11

    Defina um predicado ocorre(L,N,X) que e verdadeiro se, e somente se, X e o elemento que ocorre na posicao N da lista L.
*/
ocorre(X,1,[X|_]):-!.
ocorre(X,N,[H|T]):-
    N1 is N-1,
    ocorre(X,N1,T).

/*
    Exercicio 12
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Escreva um predicado fatores_primos(N,F) que recebe um numero natural positivo N e devolve uma lista F contendo sua decomposicao em fatores primos.

    ?- fatores_primos(1, F).
    F = []
    ?- fatores_primos(2, F).
    F = [2]

    primeiro passo é ver se o numero é primo,
    Divisivel apenas por ele mesmo.
*/

%   Exercicio 13
fat(0,1):-!.
fat(N,M) :-
    N1 is N-1,
    fat(N1,M1),
    M is N*M1.

/*
    Exercicio 14
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% - Valores Dobrados.
    Fatorial duplo,
    5!! = 1x3x5 = 15
*/
fat2(0,1):-!.
fat2(N,F):-
    N1 is mod(N,2),
    N1 =\= 0,
    N2 is N-2,
    fat(N2,M1),
    F is N*M1,!.

/*
    Exercicio 15
    FatQuad = fat(2*n)/fat(n)
*/
fatquad(N,F) :-
    N2 is N*2,
    fat(N2,N2Fat),
    fat(N,NFat),
    F is N2Fat/NFat.
