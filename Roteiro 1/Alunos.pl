aluno(paulo,poo).
aluno(pedro,poo).
aluno(maria,pl).
aluno(rui,pl).
aluno(manuel,pl).
aluno(pedro,pl).
aluno(rui,ed1).

estuda(paulo).
estuda(maria).
estuda(manuel).

% Predicado cursapl/1.
cursapl(X) :- estuda(X), aluno(X,pl).

/*
    ex. 13
    aluno(paulo,pl).

    ex. 14
    aluno(rui,poo).

    ex. 15
    aluno(paulo,ed1), aluno(maria,ed1).

    ex. 16
    aluno(X,pl).

    ex. 17
    aluno(rui,Y).

    ex. 18
    aluno(A,D), estuda(A).
    aluno(maria,pl), estuda(maria).

    ex. 19
    aluno(X,pl), estuda(X).
    X = maria ;
    X = manuel ;

    A consulta nos permite saber quem cursa a materia pl e estuda, ou seja ele cursa pl. não só é aluno de pl.
*/