valor(0).
valor(1).
valor(2).
valor(3).
valor(4).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

visao(_, [], 0) :- !.
visao(Pivot, [H|T], Dist) :- (Pivot < H, visao(H, T, Dist_), Dist is (Dist_ + 1)); (Pivot >= H, visao(Pivot, T, Dist_), Dist is Dist_).

preencher([X1, X2, X3, X4]) :-
    valor(X1), valor(X2), valor(X3), valor(X4),
    todosDiferentes([X1, X2, X3, X4]).

correto(0, _).
correto(N, Visao) :- N == Visao.

solve(S) :-
    S = [
        [X11, X12, X13, X14],
        [X21, X22, X23, X24],
        [X31, X32, X33, X34],
        [X41, X42, X43, X44]
    ],

    
    %Preenche linhas

    preencher([X11, X12, X13, X14]),
    preencher([X21, X22, X23, X24]),
    preencher([X31, X32, X33, X34]),
    preencher([X41, X42, X43, X44]),

    %Preenche colunas

    preencher([X11, X21, X31, X41]),
    preencher([X12, X22, X32, X42]),
    preencher([X13, X23, X33, X43]),
    preencher([X14, X24, X34, X44]),

    %Esquerda

    visao(0, [X11, X12, X13, X14], E1),
    visao(0, [X21, X22, X23, X24], E2),
    visao(0, [X31, X32, X33, X34], E3),
    visao(0, [X41, X42, X43, X44], E4),

    correto(1, E1),
    correto(2, E2),
    correto(2, E3),
    correto(3, E4),
    % correto(0, E5),

    %Direita

    visao(0, [X14, X13, X12, X11], R1),
    visao(0, [X24, X23, X22, X21], R2),
    visao(0, [X34, X33, X32, X31], R3),
    visao(0, [X44, X43, X42, X41], R4),

    correto(2, R1),
    correto(2, R2),
    correto(3, R3),
    correto(1, R4),
    % correto(0, R5),

    %Cima    

    visao(0, [X11, X21, X31, X41], C1),
    visao(0, [X12, X22, X32, X42], C2),
    visao(0, [X13, X23, X33, X43], C3),
    visao(0, [X14, X24, X34, X44], C4),

    correto(1, C1),
    correto(3, C2),
    correto(2, C3),
    correto(2, C4),
    % correto(0, C5),

    %Baixo

    visao(0, [X41, X31, X21, X11], B1),
    visao(0, [X42, X32, X22, X12], B2),
    visao(0, [X43, X33, X23, X13], B3),
    visao(0, [X44, X34, X24, X14], B4),
    
    %testa se a quantidade de predios vista de cada lado é correta
    
    correto(3, B1),
    correto(2, B2),
    correto(3, B3),
    correto(1, B4), !.
    % correto(0, B5).