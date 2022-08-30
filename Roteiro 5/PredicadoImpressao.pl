%   Exercicio 3 -> ERRADO, USA PREDICADO PRÉ DEFINIDO, COMO FAZER SEM?
tipo(X,'Atomo') :- atom(X).
tipo(X,'Constante') :- atomic(X).
tipo(X,'Variavel') :- var(X).
tipo(X,'Termo Simples') :- var(X);atomic(X).
tipo(X,'Termo Complexo') :- 
    nonvar(X),
    functor(X,_,A),
    A > 0.
tipo(X,'Termo') :- 
    tipo(X,'Termo Simples');
    tipo(X,'Termo Complexo').

tipotermo(X,W) :- tipo(X,W).

%   Exercicio 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%