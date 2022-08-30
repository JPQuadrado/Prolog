membro(X,[X|_]).
membro(X,[_|T]):-
    membro(X,T).

/*
[trace]  ?- membro(E,[a,b]).
   Call: (10) membro(_10526, [a, b]) ? creep
   Exit: (10) membro(a, [a, b]) ? creep
E = a 
Unknown action: : (h for help)
Action? ;
   Redo: (10) membro(_10526, [a, b]) ? creep
   Call: (11) membro(_10526, [b]) ? creep
   Exit: (11) membro(b, [b]) ? Unknown option (h for help)
   Exit: (11) membro(b, [b]) ? creep
   Exit: (10) membro(b, [a, b]) ? creep
E = b ;
   Redo: (11) membro(_10526, [b]) ? creep
   Call: (12) membro(_10526, []) ? creep
   Fail: (12) membro(_10526, []) ? creep
   Fail: (11) membro(_10526, [b]) ? creep
   Fail: (10) membro(_10526, [a, b]) ? creep
false.
*/

%   2.1 Controle do nível de detalhamento
f(a).
f(b).
g(a).
g(b).
h(b).

k(X) :- f(X),g(X),h(X).

/*
?- trace.
true.

[trace]  ?- k(X).
   Call: (10) k(_43076) ? creep
   Call: (11) f(_43076) ? creep
   Exit: (11) f(a) ? creep
   Call: (11) g(a) ? creep
   Exit: (11) g(a) ? creep
   Call: (11) h(a) ? creep
   Fail: (11) h(a) ? creep
   Redo: (11) f(_43076) ? creep
   Exit: (11) f(b) ? creep
   Call: (11) g(b) ? creep
   Exit: (11) g(b) ? creep
   Call: (11) h(b) ? creep
   Exit: (11) h(b) ? creep
   Exit: (10) k(b) ? creep
X = b.


[debug]  ?- trace(h/1,all).
%         h/1: [all]
true.

[debug]  ?- k(X).
 T [11] Call: h(a)
 T [11] Fail: h(a)
 T [11] Call: h(b)
 T [11] Exit: h(b)
X = b.
*/