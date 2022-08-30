p(1).
p(2):-!.
p(3).

%   Exercicio 14
separa([],[],[]).
separa([H|T],[H|P],N) :-
    H >= 0,!,
    separa(T,P,N).
separa([H|T],P,[H|N]) :-
    H < 0,!,
    separa(T,P,N).

/*
%   Exercicio 16
f(X) :- !,X=p.
f(X) :- !,X=q.
f(X) :- X = r.

%   Exercicio 17
f(X) :- X=p,!.
f(X) :- X=q,!.
f(X) :- X=r.

%   Exercicio 18
f(X) :- X=p,!.
f(X) :- !,X=q.
f(X) :- X=r.

%   Exercicio 19
f(X) :- !,X=p.
f(X) :- X=q,!.
f(X) :- X=r.

%   Exercicio 20
f(X) :- X=p.
f(X) :- X=q,!.
f(X) :- X=r.

%   Exercicio 21
f(p) :- !.
f(q) :- !.
f(r).

%   Exercicio 22
f(p).
f(q):- !.
f(r).
*/

%   Exercicio 25
/*
nu(X,Y) :- \+(X = Y).

nu(X,Y) :- X \== Y.
*/

%   Exercicio 26
unificavel([],_,[]):-!.
unificavel([H|T],Y,Lista) :-
    \+(H = Y),
    unificavel(T,Y,Lista).
unificavel([H|T],Y,[H|Lista]):-
    \+(\+(H = Y)),
    unificavel(T,Y,Lista).
