proximo_posto(soldado, taifeiro).
proximo_posto(taifeiro, cabo).
proximo_posto(cabo,terceiro_sargento).
proximo_posto(terceiro_sargento, segundo_sargento).
proximo_posto(segundo_sargento, primeiro_sargento).
proximo_posto(primeiro_sargento, subtenente).
proximo_posto(subtenente, aspirante).
proximo_posto(aspirante, segundo_tenente).
proximo_posto(segundo_tenente, primeiro_tenente).
proximo_posto(primeiro_tenente, capitao).
proximo_posto(capitao, major).
proximo_posto(major, tenente_coronel).
proximo_posto(tenente_coronel, coronel).
proximo_posto(coronel, general_de_brigada).
proximo_posto(general_de_brigada, general_de_divisao).
proximo_posto(general_de_divisao,general_de_exercito).
proximo_posto(general_de_exercito, marechal).


% militar/2.

militar(zero, soldado).
militar(platao, soldado).
militar(dentinho, soldado).
militar(cosme, soldado).
militar(roque, soldado).
militar(quindim, soldado).
militar(blips, soldado).
militar(ky, cabo).
militar(cuca, primeiro_sargento).
militar(tainha, segundo_sargento).
militar(louise_lorota, segundo_sargento).
militar(escovinha, primeiro_tenente).
militar(mironga, primeiro_tenente).
militar(durindana, capitao).
militar(peroba, major).
militar(amos_dureza, general_de_exercito).

menor_patente(X,Y) :- proximo_posto(X,Y).
menor_patente(X,Y) :- proximo_posto(X,Z), menor_patente(Z,Y).

/*
    ?- menor_patente(X, major).
        X = capitao ;
        X = soldado ;
        X = taifeiro ;
        X = cabo ;
        X = terceiro_sargento ;
        X = segundo_sargento ;
        X = primeiro_sargento ;
        X = subtenente ;
        X = aspirante ;
        X = segundo_tenente ;
        X = primeiro_tenente ;
        false.

    ?- menor_patente(X, marechal).
        X = general_de_exercito ;
        X = soldado ;
        X = taifeiro ;
        X = cabo ;
        X = terceiro_sargento ;
        X = segundo_sargento ;
        X = primeiro_sargento ;
        X = subtenente ;
        X = aspirante ;
        X = segundo_tenente ;
        X = primeiro_tenente ;
        X = capitao ;
        X = major ;
        X = tenente_coronel ;
        X = coronel ;
        X = general_de_brigada ;
        X = general_de_divisao ;
        false.
*/

maior_patente(X,Y) :- menor_patente(Y,X).

/*
    ?- maior_patente(X, marechal).
        false.

    ?- maior_patente(X, general_de_exercito).
        X = marechal ;
        false.

    ?- maior_patente(soldado, general_de_exercito).
        false.

    ?- menor_patente(soldado, general_de_exercito).
        true .

    ?- maior_patente(general_de_exercito, cabo).
        true .
*/

subordinado(X,Y) :- militar(X,Z), militar(Y,W), menor_patente(Z,W).

/*
    ?- subordinado(zero,tainha).
        true.

    ?- subordinado(X,tainha).
        X = zero ;
        X = platao ;
        X = dentinho ;
        X = cosme ;
        X = roque ;
        X = quindim ;
        X = blips ;
        X = ky ;
        false.

    ?- subordinado(mironga, X).
        X = durindana ;
        X = peroba ;
        X = amos_dureza ;
        false.

*/