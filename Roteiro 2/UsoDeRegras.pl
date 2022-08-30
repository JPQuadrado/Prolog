%predicado sobre/2.

sobre(base, mesa).
sobre(caneca, mesa).
sobre(vidro, mesa).
sobre(lapis, vidro).
sobre(elefante, base).
sobre(novelo, elefante).
sobre(sorvete, novelo).
sobre(maca, sorvete).
sobre(hipopotamo1, maca).
sobre(hipopotamo2, hipopotamo1).
sobre(cupcake, hipopotamo2).

/*
    Se um objeto está sobre o outro, então objeto esta acima do outro.

    A esta sobre B e B está acima de C, então A está acima de C.
*/

acima_de(X,Y) :- sobre(X,Y).
acima_de(X,Z) :- sobre(X,Y), acima_de(Y,Z).

/*
    ?- acima_de(cupcake, mesa).
    true .

    ?- acima_de(lapis, mesa).
    true .

    ?- acima_de(X, novelo).
    X = sorvete ;
    X = maca ;
    X = hipopotamo1 ;
    X = hipopotamo2 ;
    X = cupcake ;
    false.

    ?- acima_de(X, caneca).
    false.

*/

abaixo_de(X,Y) :- acima_de(Y,X).

/*
    ?- abaixo_de(X,cupcake).
    X = hipopotamo2 ;
    X = hipopotamo1 ;
    X = maca ;
    X = sorvete ;
    X = novelo ;
    X = elefante ;
    X = base ;
    X = mesa ;
    false.


    ?- abaixo_de(X,lapis).
    X = vidro ;
    X = mesa ;
    false.

*/