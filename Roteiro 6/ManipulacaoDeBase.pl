% ###################################

:- dynamic res_somatorio/2.
/*
    ?- assert(q(a,b)), assertz(q(1,2)), asserta(q(foo,blug)).
    ERROR: No permission to modify static procedure `q/2'
    ERROR: Defined at c:/users/edmar/desktop/programação/prolog/roteiro 6/predicadoscomcoleta.pl:30
    ERROR: In:
    ERROR:   [11] assert(q(a,b))
    ERROR:   [10] '<meta-call>'(user:user: ...) <foreign>
    ERROR:    [9] toplevel_call(user:user: ...) at c:/program files/swipl/boot/toplevel.pl:1158
*/
%   Exercicio 07
/*
    Mesmo assim não vai?
    Fechei e abri dnv a consulta, falo q deu true mas nada apareceu, apesar de retornar true.
    Testei pelo cmd, e nada tmb.

    Mas no ?- listing.
    :- dynamic q/2.
    
    q(foo, blug).
    q(a,b).
    q(1, 2).

    ?- retract(q(1,2)), assetz( (p(X) :- h(X)) ).
    Correct to: "assertz((p(X):-h(X)))"? yes
    true.

    ?- listing.
    :- dynamic p/1.

    p(A) :-
        h(A).

    e tambem:
    :- dynamic q/2.

    q(foo, blug).
    q(a, b).

    ?- retract(q(_,_)),fail.
    false.

    ?- listing.
    :- dynamic q/2. VAZIO EM BAIXO.

    APARECE NO LISTING MAS N APARECE NA BASE DA DADOS.
*/

%   Exercicio 08
somatorio(1,1):-!.
somatorio(N,A) :-
    res_somatorio(N,A),!.
somatorio(N,Res) :-
    N1 is N-1,
    somatorio(N1,Res1),
    Res is N + Res1,
    assert(res_somatorio(N,Res)).

/*
    ?- listing(res_somatorio(A,B)).
    :- dynamic res_somatorio/2.

    res_somatorio(2, 3).
    res_somatorio(3, 6).
    res_somatorio(4, 10).
    res_somatorio(5, 15).

    NÃO FOI ESCRITO NA BASE.
*/