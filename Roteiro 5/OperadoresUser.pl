/*
Exercicio 5 Ignorado.

:- op(300,xfx,[sao,e_um]).
:- op(300,fx, gosta_de).
:- op(200,xfy,e).
:- op(100,fy,famoso).
*/
:- op(300, xfx, h).
:- op(400, xfx, ++).
:- op(350, xfx, **).
:- op(450, xfx, <-).

_ h _.
_ h _ ++ _ h _.
_ ** _ h _.

%   Exercicio 7
soma_hora(H1 h M1, H2 h M2, Resultado) :-
    H3 is H1 + H2,
    M3 is M1 + M2,
    M3 < 60,
    Resultado = H3 h M3,!.
soma_hora(H1 h M1, H2 h M2, Resultado) :-
    HK is H1 + H2,
    MK is M1 + M2,
    MK >= 60,
    H3 is HK + 1,
    M3 is MK - 60,
    Resultado = H3 h M3,!.

%   Exercicio 8
mult_hora(N, H1 h M1, Resultado) :-
    HN is N*H1,
    MN is N*M1,
    MN < 60,
    Resultado = HN h MN,!.
mult_hora(N, H1 h M1, Resultado) :-
    HN is N*H1,
    MN is N*M1,
    MN >= 60,
    M2 is MN mod 60,
    H2 is HN+MN//60,
    Resultado = H2 h M2,!.

%   Exercicio 10
Resultado <- H1 h Min1 ++ H2 h Min2 :- 
    soma_hora(H1 h Min1, H2 h Min2, Resultado).

Resultado <- K ** H h Min :- 
    mult_hora(K, H h Min, Resultado).

Resultado <- K ** H1 h Min1 ++ Q ** H2 h Min2 :- 
    	mult_hora(K, H1 h Min1, HR1 h MinR1),
 	    mult_hora(Q, H2 h Min2, HR2 h MinR2),
    	soma_hora(HR1 h MinR1, HR2 h MinR2, Resultado).