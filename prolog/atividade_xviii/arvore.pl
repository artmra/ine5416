% ['/home/evaristo-mosby/Desktop/ine5416/prolog/atividade_xviii/arvore.pl'].

no(52, 
    no(32,
        no(12,nil,nil),
        no(35,nil,nil)), 
    no(56,
        no(55,
            no(55,nil,nil),
            nil),
        no(64,nil,nil))).

no(52, 
    no(32,
        no(22,nil,nil),
        no(33,nil,nil)), 
    no(57,
        no(15,
            no(65,nil,nil),
            nil),
        no(64,nil,nil))).
        
soma(nil, 0).
soma(no(N, ArvE, ArvD),Soma) :-
    soma(ArvE,SomaEsq),
    soma(ArvD,SomaDir),
    Soma is N + SomaEsq + SomaDir.
    
membro(N, no(N, _, _)) :- !.
membro(N, no(_, ArvE, ArvD)) :-
    membro(N, ArvE), !;
    membro(N, ArvD).
    
min(X,Y,X) :- X =< Y, !.
min(X,Y,Y).

minimo(nil,1000). %INF = 1000
minimo(no(N, ArvE, ArvD),Min) :-
    minimo(ArvE, MinE),
    minimo(ArvD, MinD),
    min(MinE, MinD, MinED),
    min(N, MinED, Min).
    
caminho(Y, no(Y, _, _), [Y]) :- !.
caminho(Y, no(K, ArvE, ArvD), [K|Caminho]) :-
    caminho(Y, ArvE, Caminho), !;
    caminho(Y, ArvD, Caminho).


% ?- no(N, E, D), ocorrencias(55, no(N, E, D), Oco).
% N = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Oco = 2 .
ocorrencias(X, no(Y, nil, nil), N) :- ((X \== Y, N is 0); (X == Y, N is 1)), !.
ocorrencias(X, no(Y, ArvE, ArvD), N) :- ocorrencias(X, ArvE, N_E), 
                                        ocorrencias(X, ArvD, N_D),
                                        ((X =:= Y, N is 1 + N_E + N_D); N is N_E + N_D).
ocorrencias(X, no(Y, ArvE, nil), N) :- ocorrencias(X, ArvE, N_E),
                                       ((X =:= Y, N is 1 + N_E); N is N_E).
ocorrencias(X, no(Y, nill, ArvD), N) :- ocorrencias(X, ArvD, N_D),
                                       ((X =:= Y, N is 1 + N_D); N is N_D).

% ?- no(N, E, D), maior(35, no(N, E, D), Num).
% N = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Num = 5 .
maior(X, no(Y, nil, nil), N) :- ((X < Y, N is 1); (N is 0)), !.
maior(X, no(Y, ArvE, ArvD), N) :- maior(X, ArvE, N_E), 
                                  maior(X, ArvD, N_D),
                                  ((X < Y, N is 1 + N_E + N_D); N is N_E + N_D).
maior(X, no(Y, ArvE, nil), N) :- maior(X, ArvE, N_E),
                                       ((X < Y, N is 1 + N_E); N is N_E).
maior(X, no(Y, nill, ArvD), N) :- maior(X, ArvD, N_D),
                                       ((X < Y, N is 1 + N_D); N is N_D).

% ?- no(N, E, D), leng(no(N, E, D), Num).
% N = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Num = 8.

leng(nil, 0).
leng(no(N, ArvE, ArvD), Length) :-
    leng(ArvE,Length_E),
    leng(ArvD,Length_D),
    Length is 1 + Length_E + Length_D.

% no(N, ArvE, ArvD), media(no(N, ArvE, ArvD), Media).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Media = 45.125.

media(no(N, ArvE, ArvD), Media) :- soma(no(N, ArvE, ArvD), Soma),
                                   leng(no(N, ArvE, ArvD), Length),
                                   Media is Soma/Length, !.

% no(N, ArvE, ArvD), nao_contem(10, no(N, ArvE, ArvD)).
% true.

% no(N, ArvE, ArvD), nao_contem(55, no(N, ArvE, ArvD)).
% false.


nao_contem(X, no(N, ArvE, ArvD)) :- not(membro(X, no(N, ArvE, ArvD))).

concat([], L, L).
concat([H|T], L2, [H|Tail]) :- concat(T,L2,Tail).

% no(N, ArvE, ArvD), lista(no(N, ArvE, ArvD), Lista).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Lista = [52, 32, 12, 35, 56, 55, 55, 64].


lista(nil, []) :- !.
lista(no(N, ArvE, ArvD), [N|Tail]) :- lista(ArvE, Lista_E),
                                      lista(ArvD, Lista_D),
                                      concat(Lista_E, Lista_D, Tail).

% no(N, ArvE, ArvD), lista_pos_ordem(no(N, ArvE, ArvD), Lista).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Lista = [12, 35, 32, 55, 55, 64, 56, 52].


lista_pos_ordem(nil, []) :- !.
lista_pos_ordem(no(N, ArvE, ArvD), Lista) :- lista_pos_ordem(ArvE, Lista_E),
                                             lista_pos_ordem(ArvD, Lista_D),
                                             concat(Lista_E, Lista_D, Lista_ED),
                                             concat(Lista_ED, [N], Lista).

% no(N, ArvE, ArvD), lista_pre_ordem(no(N, ArvE, ArvD), Lista).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Lista = [52, 32, 12, 35, 56, 55, 55, 64].


lista_pre_ordem(nil, []) :- !.
lista_pre_ordem(no(N, ArvE, ArvD), Lista) :- lista_pre_ordem(ArvE, Lista_E),
                                             lista_pre_ordem(ArvD, Lista_D),
                                             concat([N], Lista_E, Lista_NE),
                                             concat(Lista_NE, Lista_D, Lista).

% no(N, ArvE, ArvD), lista_in_ordem(no(N, ArvE, ArvD), Lista).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Lista = [12, 32, 35, 52, 55, 55, 56, 64].

lista_in_ordem(nil, []) :- !.
lista_in_ordem(no(N, ArvE, ArvD), Lista) :- lista_in_ordem(ArvE, Lista_E),
                                            lista_in_ordem(ArvD, Lista_D),
                                            concat(Lista_E, [N], Lista_EN),
                                            concat(Lista_EN, Lista_D, Lista).

% ?- no(N, ArvE, ArvD), folhas(no(N, ArvE, ArvD), NFolhas).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% NFolhas = 4.

folhas(nil, 0) :- !.
folhas(no(_, nil, nil), 1) :- !.
folhas(no(N, ArvE, ArvD), NFolhas) :- folhas(ArvE, NFolhas_E),
                                      folhas(ArvD, NFolhas_D),
                                      NFolhas is NFolhas_E + NFolhas_D.

% no(N, ArvE, ArvD), lista_folhas(no(N, ArvE, ArvD), Lista).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Lista = [12, 35, 55, 64].

lista_folhas(nil, []) :- !.
lista_folhas(no(N, nil, nil), [N]) :- !.
lista_folhas(no(N, ArvE, ArvD), Lista) :- lista_folhas(ArvE, Lista_E),
                                          lista_folhas(ArvD, Lista_D),
                                          concat(Lista_E, Lista_D, Lista).

% no(N, ArvE, ArvD), iguais(no(N, ArvE, ArvD), no(N, ArvE, ArvD), Iguais).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Iguais = true.

iguais(nil, nil, true) :- !.
iguais(no(N1, ArvE1, ArvD1), no(N2, ArvE2, ArvD2), Iguais) :- N1 =:= N2,
                                                      iguais(ArvE1, ArvE2, Iguais),
                                                      iguais(ArvD1, ArvD2, Iguais), !.

% no(N, ArvE, ArvD), altura(no(N, ArvE, ArvD), Altura).
% N = 52,
% ArvE = no(32, no(12, nil, nil), no(35, nil, nil)),
% ArvD = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% Altura = 4 .

altura(nil, 0) :- !.
altura(no(N, ArvE, ArvD), Altura) :- altura(ArvE, Altura_E),
                                     altura(ArvD, Altura_D),
                                     ((Altura_E > Altura_D, Altura is 1 + Altura_E); Altura is 1 + Altura_D).

% caminhoXparaY(52, 64, Caminho) .
% Caminho = [52, 56, 64] .

caminhoXparaY(X, Y, Caminho) :- no(X, ArvE, ArvD), caminho(Y, no(X, ArvE, ArvD), Caminho).