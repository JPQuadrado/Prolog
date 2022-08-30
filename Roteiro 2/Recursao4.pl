deCarro(auckland,hamilton).
deCarro(hamilton,raglan).
deCarro(valmont,saarbruecken).
deCarro(valmont,metz).

deTrem(metz,frankfurt).
deTrem(saarbruecken,frankfurt).
deTrem(metz,paris).
deTrem(saarbruecken,paris).

deAviao(frankfurt,bangkok).
deAviao(frankfurt,singapore).
deAviao(paris,losAngeles).
deAviao(bangkok,auckland).
deAviao(losAngeles,auckland).

viagem(X,Y) :- deCarro(X,Y);deTrem(X,Y);deAviao(X,Y).
viagem(X,Y) :- (deCarro(X,Z);deTrem(X,Z);deAviao(X,Z)), viagem(Z,Y).

%%%%%%%%%%

viagem(X,Y, vai(X,Y)) :- deCarro(X,Y);deTrem(X,Y);deAviao(X,Y).
viagem(X,Y, vai(X,Z,C)) :- 
    (deCarro(X,Z);deTrem(X,Z);deAviao(X,Z)),
    viagem(Z,Y,C).

%%%%%%%%%%

viagem3(X,Y, vai_de(carro,X,Y)) :- deCarro(X,Y).
viagem3(X,Y,vai_de(trem,X,Y)) :- deTrem(X,Y).
viagem3(X,Y,vai_de(aviao,X,Y)) :- deAviao(X,Y).

viagem3(X,Y,vai_de(carro,X,Z,D)) :- deCarro(X,Z), viagem3(Z,Y,D).
viagem3(X,Y,vai_de(trem,X,Z,D)) :- deTrem(X,Z), viagem3(Z,Y,D).
viagem3(X,Y,vai_de(aviao,X,Z,D)) :- deAviao(X,Z), viagem3(Z,Y,D).

