%Exercício1----------------------------
:- dynamic palavra/2.
%le as palavras do arquivo e coloca em uma lista
le_palavra(Fluxo,[]):-
	at_end_of_stream(Fluxo).
	
le_palavra(Fluxo,[Palavra|Y]):-
	\+ at_end_of_stream(Fluxo),	
	get_code(Fluxo,Caracter),
	leresto(Caracter,Caracteres,Fluxo),
	atom_codes(Palavra,Caracteres),le_palavra(Fluxo,Y).

leresto(59,[],_):- !.%ponto e vírgula
leresto(44,[],_):- !.%vírgula
leresto(33, [], _):- !. %exclamação
leresto(10, [], _):- !. 
leresto(32, [], _):- !. %espaço branco
leresto(-1, [], _):- !. 
leresto(Caracter,[Caracter|Caracteres],Fluxo):-
get_code(Fluxo,ProxCaracter),
leresto(ProxCaracter,Caracteres,Fluxo).

%coloca as palavras da lista na memória e somo a frequencia caso ja exista
coloca_palavra([]).
coloca_palavra([Palavra|Cauda]):- 
	(palavra(Palavra,Freq),
	FreqAntiga = Freq,
	NovaFreq is FreqAntiga+1, 
	retractall(palavra(Palavra,Freq)),  
	assert(palavra(Palavra,NovaFreq));
	(\+(palavra(Palavra,Freq)),
	FreqAntiga = 0,
	NovaFreq is FreqAntiga+1,
	assert(palavra(Palavra,NovaFreq)))),coloca_palavra(Cauda).

%abrir o arquivo, ler todas as palavras e colocar em uma lista, consultar se a palavra ja está na memória e se estiver,remover da memória e adicionar o predicado novamente porém com a frequencia somada +1 da antiga, senao estiver, colocar na memória e continuar colocando o resto dos elementos da lista até a lista ficar vazia.
histograma(Arquivo):- 
open(Arquivo,read,F),le_palavra(F,Texto),coloca_palavra(Texto),close(F).

%Exercício2---------------------------------------------------
le_palavra_adaptado(Fluxo,[]):-
	at_end_of_stream(Fluxo).
	
le_palavra_adaptado(Fluxo,[Palavra|Y]):-
\+ at_end_of_stream(Fluxo),	
get_code(Fluxo,Caracter),
leresto_adaptado(Caracter,Caracteres,Fluxo),
atom_codes(Palavra,Caracteres),le_palavra_adaptado(Fluxo,Y).

leresto_adaptado(-1,[],_):-!.
leresto_adaptado(Caracter,[Caracter|Caracteres],Fluxo):-
get_code(Fluxo,ProxCaracter),
leresto_adaptado(ProxCaracter,Caracteres,Fluxo).

escreve_arquivo(F,[]).
escreve_arquivo(F,[Palavra|Palavras]):- write(F,Palavra),escreve_arquivo(F,Palavras).

copia_arq(Arquivo1,Arquivo2):- open(Arquivo1,read,F),le_palavra_adaptado(F,Lista),close(F),open(Arquivo2,write,F2),escreve_arquivo(F2,Lista),close(F2).

%Exercício3------------------------------------------------------
idênticos(Arquivo1,Arquivo2):- open(Arquivo1,read,F1), le_palavra_adaptado(F1,Lista1),close(F1),open(Arquivo2,read,F2),le_palavra_adaptado(F2,Lista2),close(F2),!,Lista1=Lista2.

%Exercício4-----------------------------------------------------
/*
s(C):- sn(A), sv(B), append(A,B,C).
sn(C):- det(A), n(B), append(A,B,C).
sv(C):- v(A), sn(B), append(A,B,C).
sv(C):- v(C).
det([o]).
det([a]).
n([homem]).     
n([mulher]).      
n([bola]). 
v([chuta]).
*/
%Exercício5----------------------------------------------------
/*
s(A-C):- sn(A-B), sv(B-C).%[a,mulher,chuta,o,homem]
sn(A-C):- det(A-B), n(B-C).
sv(A-C):- v(A-B), sn(B-C).
sv(A-C):- v(A-C).
det([o|P]-P). 
det([a|P]-P).
n([homem|P]-P).    
n([mulher|P]-P).      
n([bola|P]-P).
v([chuta|P]-P).
*/
%Exercício6---------------------------------------------------
/*
s --> sn, sv.
sn --> det, n.
sv --> v, sn.
sv --> v.
det --> [o].
det --> [a].
n--> [homem].       
n--> [mulher].      
n --> [bola].
v--> [chuta]. 
*/
%Exercício7------------------------------------------------
%só consultas.
/*
s --> [].
s --> e,s,d.
e --> [a].
d --> [b].
*/
%Exercício8-----------------------------------------------
aPar --> [].
aPar --> e,aPar,e.
e --> [a]. 
%Exercício9-----------------------------------------------
prop --> simbolo.
prop --> operador(prefixo),prop.
prop --> precedencia(prefixa),prop,operador(infixo),prop,precedencia(sufixa).
operador(prefixo) --> [não].
operador(infixo) --> [e].
operador(infixo) --> [ou].
operador(infixo) --> [implica].
simbolo --> [p].
simbolo --> [q].
simbolo --> [r].
precedencia(prefixa) --> ['('].
precedencia(sufixa) --> [')'].
%Exercício10----------------------------------------------
s --> foo,bar,wiggle.
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
%Resultado 3 primeiras consultas
%chu,eu,sou,um,trem,tchu
%chu,eu,sou,um,trem,tchu,tchu
%chu,eu,sou,um,trem,tchu,tchu,tchu
%-----------------------------------

%Predicados escritos de forma normal

%s(A,D):- foo(A,B),bar(B,C),wiggle(C,D).
%foo([chu|A],A).
%foo(A,C):- foo(A,B),foo(B,C).
%bar(A,C) :- mar(A,B),zar(B,C).
%mar(A,C) :- me(A,B),my(B,C).
%me([eu|A],A).
%my([sou|A],A).
%zar(A,C) :- blar(A,B),car(B,C).
%blar([um|A],A).
%car([trem|A],A).
%wiggle([tchu|A],A).
%wiggle(A,C) :- wiggle(A,B),wiggle(B,C).

%Exercicio11---------------------------------------------
asebs --> l,r.
asebs --> l,asebs,r.
l --> [a].
r --> [b].

%Exercicio12----------------------------------------------
asebs2 --> [].
asebs2 --> l2,asebs2,r2,r2.
l2 --> [a].
r2 --> [b].


