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

% ?- no(N, E, D), num_elementos(no(N, E, D), Num).
num_elementos(nill, N) :- N is 0.
num_elementos(no(X, ArvE, ArvD), N) :- num_elementos(ArvE, N_E), num_elementos(ArvD, N_D), N is 1 + N_E + N_D.