% Não usar NENHUM PREDICADO pré definido.

% Exercicio 1

% Exercicio 2 - anbncn, inclui [], não sei tirar.
% ######

anbncn(Conta) --> as(Conta),bs(Conta),cs(Conta).

as(0) --> [].
as(NovoCnt) --> [a],as(Cnt),{NovoCnt is Cnt + 1}.

bs(0) --> [].
bs(NovoCnt) --> [b],bs(Cnt),{NovoCnt is Cnt + 1}.

cs(0) --> [].
cs(NovoCnt) --> [c],cs(Cnt),{NovoCnt is Cnt + 1}.

% Exercicio 3 - anbmcmdn, inclui [], não sei tirar.
/*
    O que é a minha sentença, pensar nos elementos:

    S = [a]*n,[b]*m,[c]*m,[d]*n.

    A e D se relacionam.
    B e C se relacionam.

    FUNCIONA, MAS VAMOS FAZER COM CONTA.
    anbmcmdn --> x.
    anbmcmdn --> [a],anbmcmdn,[d].

    x --> [].
    x --> [b],x,[c].
*/
anb2mc2mdn(N,M2) --> a1(N),b2(M),c2(M),d1(N),{M2 is M*2}.

a1(0) --> [].
a1(NovoCnt) --> [a],as(Cnt),{NovoCnt is Cnt + 1}.

b2(0) --> [].
b2(NovoCnt) --> [b],bs(Cnt),{NovoCnt is Cnt + 1}.

c2(0) --> [].
c2(NovoCnt) --> [c],cs(Cnt),{NovoCnt is Cnt + 1}.

d1(0) --> [].
d1(NovoCnt) --> [c],cs(Cnt),{NovoCnt is Cnt + 1}.

% Exercicio 4 - Alterando a DCG Básica.
s --> sn(X), sv(X).
sn(X) --> det(X), n(X).
sv(X) --> v(X), sn(X).
sv(X) --> v(X).

det(sing) --> [o].
det(sing) --> [a].
det(plu) --> [os].
det(plu) --> [as].
n(sing) --> [mulher].
n(sing) --> [homem].
n(plu) --> [mulheres].
n(plu) --> [homens].
v(sing) --> [bate].
v(plu) --> [batem].

/*
Exercicio 5 - Traduz regra DCG em formato padrão prolog.

    A DCG:
    cangu(V,R,Q) --> ru(V,R), salta(Q,Q), {}

    {entre_chaves_prolog_não_mexe} 

    O que esta nos parentes são apenas argumentos EXTRA.
    
    .:
    cangu(V,R,Q,A,D) :-
        ru(V,R,A,B),
        salta(Q,Q,B,C),
        marssupial(V,R,Q,C,D). --> D se iguala a C então?.    
    
    Teoria, vamos colocar o predicado e dar um listing.
*/
% cangu(V,R,Q) --> ru(V,R), salta(Q,Q), {marsupial(V,R,Q)}.
/*
    Pelo listing.
    cangu(V, R, Q, A, B) :-
        ru(V, R, A, C),
        salta(Q, Q, C, D),
        marsupial(V, R, Q),
        B=D.
    
    Por que o prolog unifica diretamente no listing?
*/

% Exercicio 6 - DCG COMPLETA.

% Exercicio 7 - Cardinais - Funcionando.
% DAVA PRA FAZER MAIS SIMPLES, EU ACREDITO.

cardinal --> [zero].
cardinal --> numUnidade.
cardinal --> numDezena(solo) | numCentena(junto).
cardinal --> numDezena(junto),[e],numUnidade.
cardinal --> numCentena(cem) | numCentena(junto).
cardinal --> numCentena(junto),[e],(numDezena(junto)|numDezena(solo)).
cardinal --> numCentena(junto),[e],numDezena(junto),[e],numUnidade.
cardinal --> [mil].

numUnidade --> [um].
numUnidade --> [dois].
numUnidade --> [tres].
numUnidade --> [quatro].
numUnidade --> [cinco].
numUnidade --> [seis].
numUnidade --> [sete].
numUnidade --> [oito].
numUnidade --> [nove].

numDezena(solo) --> [dez].
numDezena(solo) --> [onze].
numDezena(solo) --> [doze].
numDezena(solo) --> [treze].
numDezena(solo) --> [catorze].
numDezena(solo) --> [quinze].
numDezena(solo) --> [dezesseis].
numDezena(solo) --> [dezessete].
numDezena(solo) --> [dezoito].
numDezena(solo) --> [dezenove].

numDezena(junto) --> [vinte].
numDezena(junto) --> [trinta].
numDezena(junto) --> [quarenta].
numDezena(junto) --> [cinquenta].
numDezena(junto) --> [sessenta].
numDezena(junto) --> [setenta].
numDezena(junto) --> [oitenta].
numDezena(junto) --> [noventa].

numCentena(cem) --> [cem].

numCentena(junto) --> [cento].
numCentena(junto) --> [duzentos].
numCentena(junto) --> [trezentos].
numCentena(junto) --> [quatrocentos].
numCentena(junto) --> [quinhentos].
numCentena(junto) --> [seiscentos].
numCentena(junto) --> [setecentos].
numCentena(junto) --> [oitocentos].
numCentena(junto) --> [novecentos].


% Exercicio 8 - Modificar para aparecer o numero também.
% DAVA PRA FAZER MAIS SIMPLES, EU ACREDITO.

cardinalN([0]) --> [zero].
cardinalN([NU]) --> numUnidade(NU).
cardinalN([NDtimes]) --> numDezena(junto,ND), {NDtimes is ND * 10}.
cardinalN([NC,ND]) --> numDezena(solo,ND) | numCentena(junto,NC).
cardinalN([ND,NU]) --> numDezena(junto,ND),[e],numUnidade(NU).
cardinalN([NCem,NCtimes]) --> numCentena(cem,NCem) | numCentena(junto,NC),{NCtimes is NC * 100}.
cardinalN([NC,ND,NU]) --> 
    numCentena(junto,NC),[e],((numDezena(junto,ND),{NU is 0})| (numDezena(solo,NDmod),{NU is mod(ND,10), ND is NDmod/10})).
cardinalN([NC,ND,NU]) --> numCentena(junto,NC),[e],numDezena(junto,ND),[e],numUnidade(NU).
cardinalN([1,0,0,0]) --> [mil].

numUnidade(1) --> [um].
numUnidade(2) --> [dois].
numUnidade(3) --> [tres].
numUnidade(4) --> [quatro].
numUnidade(5) --> [cinco].
numUnidade(6) --> [seis].
numUnidade(7) --> [sete].
numUnidade(8) --> [oito].
numUnidade(9) --> [nove].

numDezena(solo,10) --> [dez].
numDezena(solo,11) --> [onze].
numDezena(solo,12) --> [doze].
numDezena(solo,13) --> [treze].
numDezena(solo,14) --> [catorze].
numDezena(solo,15) --> [quinze].
numDezena(solo,16) --> [dezesseis].
numDezena(solo,17) --> [dezessete].
numDezena(solo,18) --> [dezoito].
numDezena(solo,19) --> [dezenove].

numDezena(junto,2) --> [vinte].
numDezena(junto,3) --> [trinta].
numDezena(junto,4) --> [quarenta].
numDezena(junto,5) --> [cinquenta].
numDezena(junto,6) --> [sessenta].
numDezena(junto,7) --> [setenta].
numDezena(junto,8) --> [oitenta].
numDezena(junto,9) --> [noventa].

numCentena(cem,100) --> [cem].

numCentena(junto,1) --> [cento].
numCentena(junto,2) --> [duzentos].
numCentena(junto,3) --> [trezentos].
numCentena(junto,4) --> [quatrocentos].
numCentena(junto,5) --> [quinhentos].
numCentena(junto,6) --> [seiscentos].
numCentena(junto,7) --> [setecentos].
numCentena(junto,8) --> [oitocentos].
numCentena(junto,9) --> [novecentos].


