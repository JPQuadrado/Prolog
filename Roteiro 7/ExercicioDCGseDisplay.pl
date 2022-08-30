% Exercicio 4 e 5 é de rastreamento. Olhar depois.
% Exercicio 6, DCG da Aula 7a - Pagina 30.
s --> sn,sv.
sn --> det,n.
sv --> v.
det --> [o].
det --> [a].
n --> [homem].
n --> [mulher].
n --> [bola].
v --> [chuta].
/*
    Listing disso:

    s(A, B) :-
        sn(A, C),
        sv(C, B).
    sn(A, B) :-
        det(A, C),
        n(C, B).
    sv(A, B) :-
        v(A, B).
    
    det([o|A],A).
    det([a|A],A).

    v([chuta|A], A).
    n([homem|A], A).
    n([mulher|A], A).
    n([bola|A], A).

    Prolog le assim.
*/
% Exercicio 7 - rastreamento? não entendi bem oque rastrear.

% Exercicio 8 - aPar.
a --> [].
a --> [a,a], a.

% Exercicio 9 - Logica reconhecer.
prop --> [p].
prop --> [q].
prop --> [r].
prop --> ['('],prop,[implica],prop,[')'].
prop --> ['('],prop,['^'],prop,[')'].
prop --> ['('],prop,['v'],prop,[')'].
prop --> [nao],prop.


% Exercicio 9
h --> foo,bar,wiggle.
foo --> [chu].
foo --> foo,foo.
bar --> mar,zar.
mar --> me,my.
me --> [eu].
my --> [sou].
zar --> blar,car.
blar --> [um].
car --> [trem].
wiggle --> [tchu].
wiggle --> wiggle,wiggle.
/*
    chamada h(X,[]). - 3 primeiras respostas.
    mudei para h, devido a s anterior.

    h(X,[]).
    X = [chu, eu, sou, um, trem, tchu] ;
    X = [chu, eu, sou, um, trem, tchu, tchu] ;
    X = [chu, eu, sou, um, trem, tchu, tchu, tchu] ;
    X = [chu, eu, sou, um, trem, tchu, tchu, tchu, tchu] ;
    X = [chu, eu, sou, um, trem, tchu, tchu, tchu, tchu|...] 

*/

% Exercicio 11 e 12 - [] -> não deve entrar, não consegui fazer o exceto.
% #######
anbn --> [].
anbn --> l,anbn,r.

anb2n --> [].
anb2n --> l,anb2n,r,r.

l --> [a].
r --> [b].

% Parte 3 - Consultas sobre display
/*
    ?- display([a,b,c]).
    '[|]'(a,'[|]'(b,'[|]'(c,[])))

    ?- display(3 is 4 + 5 / 3).
    is(3,+(4,/(5,3))).

    ?- display(3 is (4 + 5) / 3).
    is(3,/(+(4,5),3))

    ?- display((a:-b,c,d)).
    :-(a,','(b,','(c,d)))

    ?- display(a:-b,c,d).
    Erro, não existe o display/3, sempre /1.

    Descrição de write, sem solicitar testes.
*/
