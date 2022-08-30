homem(abraham).
homem(clancy).
homem(herbert).
homem(homer).
homem(bart).

mulher(mona).
mulher(jacqueline).
mulher(abbey).
mulher(marge).
mulher(selma).
mulher(patty).
mulher(lisa).
mulher(maggie).
mulher(ling).

pai(abraham, homer).
pai(abraham, herbert).
pai(abraham,abbey).
pai(clancy, marge).
pai(clancy,selma).
pai(clancy,patty).
pai(homer,maggie).
pai(homer,lisa).
pai(homer,bart).

mae(mona,homer).
mae(jacqueline, marge).
mae(jacqueline,selma).
mae(jacqueline,patty).
mae(selma,ling).
mae(marge, maggie).
mae(marge, lisa).
mae(marge, bart).

avo(X,Y) :- pai(X,Z), (pai(Z,Y);mae(Z,Y)).
avoa(X,Y) :- mae(X,Z), (pai(Z,Y);mae(Z,Y)).

filho(X,Y) :- homem(X),(pai(Y,X);mae(Y,X)).
filha(X,Y) :- mulher(X),(pai(Y,X);mae(Y,X)).

irmao(X,Y) :- homem(X),(pai(Z,X);mae(Z,X)),(pai(Z,Y);mae(Z,Y)).
irma(X,Y) :- mulher(X),(pai(Z,X);mae(Z,X)),(pai(Z,Y);mae(Z,Y)).
irmaos(X,Y) :- (pai(Z,X);mae(Z,X)),(pai(Z,Y);mae(Z,Y)).

tio(X,Y) :- homem(X),irmao(X,Z),(pai(Z,Y);mae(Z,Y)),not(pai(X,Y)).
tia(X,Y) :- mulher(X),irma(X,Z),(pai(Z,Y);mae(Z,Y)),not(mae(X,Y)).

primo(X,Y) :- 
    homem(X),
    (pai(Z,X);mae(Z,X)),
    (pai(W,Y);mae(W,Y)),
    irmaos(Z,W),
    not(irmaos(X,Y)).
prima(X,Y) :- 
    mulher(X),
    (pai(Z,X);mae(Z,X)),
    (pai(W,Y);mae(W,Y)),
    irmaos(Z,W),
    not(irmaos(X,Y)).

/*
    PROBLEMAS:
    O not resolve o problema, mas ainda não o aprendemos.
*/