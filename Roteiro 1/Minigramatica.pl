palavra(artigo,uma).
palavra(artigo,qualquer). % 'qualquer' e um pronome, mas deixaremos assim.
palavra(nome,pessoa).
palavra(nome,'sopa de legumes').
palavra(verbo,come).
palavra(verbo,adora).

sentenca(Palavra1, Palavra2, Palavra3, Palavra4, Palavra5) :-
    palavra(artigo,Palavra1),
    palavra(nome,Palavra2),
    palavra(verbo,Palavra3),
    palavra(artigo,Palavra4),
    palavra(nome,Palavra5).

/*
    Ex. 10 Qual consulta deve-se colocar a fim de encontrar quais sentencas a gramatica pode gerar?

    sentenca(A,B,C,D,E).

    Uma pessoa come uma pessoa.
    Uma pessoa come uma sopa de legumes.
    Uma pessoa come qualquer pessoa.
    Uma pessoa come qualquer sopa de legumes.
    Uma pessoa adora uma pessoa.
    Uma pessoa adora uma sopa de legumes.
    Uma pessoa adora qualquer pessoa.
    Uma pessoa adora qualquer sopa de legumes.
    Uma sopa de legumes come uma pessoa.
    Uma sopa de legumes uma sopa de legumes.
    Uma sopa de legumes qualquer pessoa.
    Uma sopa de legumes qualquer sopa de legumes.
    Uma sopa de legumes adora uma pessoa.
    Uma sopa de legumes adora uma sopa de legumes.
    Uma sopa de legumes adora qualquer pessoa.
    Uma sopa de legumes adora qualquer sopa de legumes.
    Qualquer pessoa come uma pessoa.
    Qualquer pessoa come uma sopa de legumes.
    Qualquer pessoa come qualquer pessoa.
    Qualquer pessoa come qualquer sopa de legumes.
    Qualquer pessoa adora uma pessoa.
    Qualquer pessoa adora uma sopa de legumes.
    Qualquer pessoa adora qualquer pessoa.
    Qualquer pessoa adora qualquer sopa de legumes.
    Qualquer sopa de legumes come uma pessoa.
    Qualquer sopa de legumes uma sopa de legumes.
    Qualquer sopa de legumes qualquer pessoa.
    Qualquer sopa de legumes qualquer sopa de legumes.
    Qualquer sopa de legumes adora uma pessoa.
    Qualquer sopa de legumes adora uma sopa de legumes.
    Qualquer sopa de legumes adora qualquer pessoa.
    Qualquer sopa de legumes adora qualquer sopa de legumes.
*/