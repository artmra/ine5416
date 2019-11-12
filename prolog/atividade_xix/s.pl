% ['/home/evaristo-mosby/Desktop/ine5416/prolog/atividade_xix/s.pl'].

rainha("R").
rainha(" ").

nRainhas([], 0).
nRainhas([H|T], N_rainhas) :-  nRainhas(T, N_rainhas_), ((H ==  " ", N_rainhas is N_rainhas_);
                              (N_rainhas is N_rainhas_ + 1)).

sozinhaLinha(L) :- nRainhas(L, N_rainhas), N_rainhas =:= 1.

n_elemento([H|_], 1, H) :- !.
n_elemento([_|T], I, Elemento) :- I_ is I - 1, n_elemento(T, I_, Elemento).

index_rainha([H|_], 1) :- H \== " ", !.
index_rainha([H|T], I) :- H == " ", index_rainha(T, I_), I is I_ + 1.

concat([], L, L).
concat([H|T], L2, [H|Tail]) :- concat(T,L2,Tail).

leng([], 0) :- !.
leng([_|T], Leng) :- leng(T, Leng_), Leng is Leng_ + 1.

coluna([], _, []) :- !.
coluna([H|T], ColNum, [Elemento|Tail]) :- n_elemento(H, ColNum, Elemento), coluna(T, ColNum, Tail).

linha([H|_], 1, H) :- !.
linha([_|T], RowNum, Row) :- RowNum_ is RowNum - 1, linha(T, RowNum_, Row).

diagonal_parte_superior(Lista, 1, ColNum, Diagonal) :- (ColNum < 1, Diagonal = [], !);
                                                       linha(Lista, 1, Linha),
                                                       n_elemento(Linha, ColNum, Elemento), Diagonal = [Elemento], !.
diagonal_parte_superior(Lista, RowNum, ColNum, Diagonal) :- (ColNum < 1, Diagonal = []);
                                                            linha(Lista, RowNum, Linha),
                                                            n_elemento(Linha, ColNum, Elemento),
                                                            RowNum_ is (RowNum - 1),
                                                            ColNum_ is (ColNum - 1),
                                                            diagonal_parte_superior(Lista, RowNum_, ColNum_, H),
                                                            concat(H, [Elemento], Diagonal).

diagonal_parte_superior_r(Lista, 1, ColNum, Diagonal) :- (leng(Lista, Leng), ColNum > Leng, Diagonal = [], !);
                                                           linha(Lista, 1, Linha),
                                                           n_elemento(Linha, ColNum, Elemento), Diagonal = [Elemento], !.
diagonal_parte_superior_r(Lista, RowNum, ColNum, Diagonal) :- (leng(Lista, Leng), ColNum > Leng, Diagonal = []);
                                                            linha(Lista, RowNum, Linha),
                                                            n_elemento(Linha, ColNum, Elemento),
                                                            RowNum_ is (RowNum - 1),
                                                            ColNum_ is (ColNum + 1),
                                                            diagonal_parte_superior_r(Lista, RowNum_, ColNum_, H),
                                                            concat(H, [Elemento], Diagonal).

diagonal_parte_inferior(Lista, RowNum, ColNum, Diagonal) :- (leng(Lista, Leng), ((RowNum > Leng); (ColNum > Leng)), Diagonal = []);
                                                            linha(Lista, RowNum, Linha),
                                                            n_elemento(Linha, ColNum, Elemento),
                                                            RowNum_ is (RowNum + 1),
                                                            ColNum_ is (ColNum + 1),
                                                            diagonal_parte_inferior(Lista, RowNum_, ColNum_, T),
                                                            concat([Elemento], T, Diagonal).

diagonal_parte_inferior_r(Lista, RowNum, ColNum, Diagonal) :- (leng(Lista, Leng), ((RowNum > Leng); (ColNum < 1)), Diagonal = []);
                                                            linha(Lista, RowNum, Linha),
                                                            n_elemento(Linha, ColNum, Elemento),
                                                            RowNum_ is (RowNum + 1),
                                                            ColNum_ is (ColNum - 1),
                                                            diagonal_parte_inferior(Lista, RowNum_, ColNum_, T),
                                                            concat([Elemento], T, Diagonal).

diagonal(Lista, RowNum, ColNum, Diagonal) :- diagonal_parte_superior(Lista, RowNum, ColNum, Diagonal_parte_superior),
                                             RowNum_ is (RowNum + 1), ColNum_ is (ColNum + 1),
                                             diagonal_parte_inferior(Lista, RowNum_, ColNum_, Diagonal_parte_inferior),
                                             concat(Diagonal_parte_superior, Diagonal_parte_inferior, Diagonal).

diagonal_r(Lista, RowNum, ColNum, Diagonal) :- diagonal_parte_superior_r(Lista, RowNum, ColNum, Diagonal_parte_superior),
                                             RowNum_ is (RowNum + 1), ColNum_ is (ColNum - 1),
                                             diagonal_parte_inferior_r(Lista, RowNum_, ColNum_, Diagonal_parte_inferior),
                                             concat(Diagonal_parte_superior, Diagonal_parte_inferior, Diagonal).


% coluna([[" ", " ", " ", 1, " "],
%         [" ", " ", 2, " ", " "],
%         [" ", " ", " ", 1, " "],
%         [" ", " ", " ", 4, " "],
%         [" ", " ", 3 , 1 , " "]], 3, Col).

% diagonal([[" ", " ", " ", 1, " "], [" ", " ", 2 , " ", " "], [" ", " ", " ", 1, " "], [" ", " ", " ", 4, " "], [" ", " ", 3, 1, " "]], 3, 4, Diagonal).
% diagonal_r([[" ", " ", " ", 1, " "], [" ", " ", 2 , " ", " "], [" ", " ", " ", 1, " "], [" ", " ", " ", 4, " "], [" ", " ", 3, 1, " "]], 3, 4, Diagonal).

solve(S) :- 
    S = 
    [
        linha_([X11, X12, X13, X14, X15, X16, X17, X18]),
        linha_([X21, X22, X23, X24, X25, X26, X27, X28]),
        linha_([X31, X32, X33, X34, X35, X36, X37, X38]),
        linha_([X41, X42, X43, X44, X45, X46, X47, X48]),
        linha_([X51, X52, X53, X54, X55, X56, X57, X58]),
        linha_([X61, X62, X63, X64, X65, X66, X67, X68]),
        linha_([X71, X72, X73, X74, X75, X76, X77, X78]),
        linha_([X81, X82, X83, X84, X85, X86, X87, X88])
    ],

    rainha(X11), rainha(X12), rainha(X13), rainha(X14), rainha(X15), rainha(X16), rainha(X17), rainha(X18),
    rainha(X21), rainha(X22), rainha(X23), rainha(X24), rainha(X25), rainha(X26), rainha(X27), rainha(X28), 
    rainha(X31), rainha(X32), rainha(X33), rainha(X34), rainha(X35), rainha(X36), rainha(X37), rainha(X38), 
    rainha(X41), rainha(X42), rainha(X43), rainha(X44), rainha(X45), rainha(X46), rainha(X47), rainha(X48),
    rainha(X51), rainha(X52), rainha(X53), rainha(X54), rainha(X55), rainha(X56), rainha(X57), rainha(X58),
    rainha(X61), rainha(X62), rainha(X63), rainha(X64), rainha(X65), rainha(X66), rainha(X67), rainha(X68), 
    rainha(X71), rainha(X72), rainha(X73), rainha(X74), rainha(X75), rainha(X76), rainha(X77), rainha(X78), 
    rainha(X81), rainha(X82), rainha(X83), rainha(X84), rainha(X85), rainha(X86), rainha(X87), rainha(X88),

    linha(S, 1, Linha1),
    sozinhaLinha(Linha1),
    index_rainha(Linha1, ColNum1),
    diagonal(S, 1, ColNum1, Diagonal1),
    diagonal_r(S, 1, ColNum1, Diagonalr1),
    coluna(S, 1, Coluna1),
    sozinhaLinha(Diagonal1),
    sozinhaLinha(Diagonalr1),
    sozinhaLinha(Coluna1),

    linha(S, 2, Linha2),
    sozinhaLinha(Linha2),
    index_rainha(Linha2, ColNum2),
    diagonal(S, 2, ColNum2, Diagonal2),
    diagonal_r(S, 2, ColNum2, Diagonalr2),
    coluna(S, 2, Coluna2),
    sozinhaLinha(Diagonal2),
    sozinhaLinha(Diagonalr2),
    sozinhaLinha(Coluna2), 
    
    linha(S, 3, Linha3),
    sozinhaLinha(Linha3),
    index_rainha(Linha3, ColNum3),
    diagonal(S, 3, ColNum3, Diagonal3),
    diagonal_r(S, 3, ColNum3, Diagonalr3),
    coluna(S, 3, Coluna3),
    sozinhaLinha(Diagonal3),
    sozinhaLinha(Diagonalr3),
    sozinhaLinha(Coluna3), 
    
    linha(S, 4, Linha4),
    sozinhaLinha(Linha4),
    index_rainha(Linha4, ColNum4),
    diagonal(S, 4, ColNum4, Diagonal4),
    diagonal_r(S, 4, ColNum4, Diagonalr4),
    coluna(S, 4, Coluna4),
    sozinhaLinha(Diagonal4),
    sozinhaLinha(Diagonalr4),
    sozinhaLinha(Coluna4),

    linha(S, 5, Linha5),
    sozinhaLinha(Linha5),
    index_rainha(Linha5, ColNum5),
    diagonal(S, 5, ColNum5, Diagonal5),
    diagonal_r(S, 5, ColNum5, Diagonalr5),
    coluna(S, 5, Coluna5),
    sozinhaLinha(Diagonal5),
    sozinhaLinha(Diagonalr5),
    sozinhaLinha(Coluna5),

    linha(S, 6, Linha6),
    sozinhaLinha(Linha6),
    index_rainha(Linha6, ColNum6),
    diagonal(S, 6, ColNum6, Diagonal6),
    diagonal_r(S, 6, ColNum6, Diagonalr6),
    coluna(S, 6, Coluna6),
    sozinhaLinha(Diagonal6),
    sozinhaLinha(Diagonalr6),
    sozinhaLinha(Coluna6),

    linha(S, 7, Linha7),
    sozinhaLinha(Linha7),
    index_rainha(Linha7, ColNum7),
    diagonal(S, 7, ColNum7, Diagonal7),
    diagonal_r(S, 7, ColNum7, Diagonalr7),
    coluna(S, 7, Coluna7),
    sozinhaLinha(Diagonal7),
    sozinhaLinha(Diagonalr7),
    sozinhaLinha(Coluna7),

    linha(S, 8, Linha8),
    
    index_rainha(Linha8, ColNum8),
    diagonal(S, 8, ColNum8, Diagonal8),
    diagonal_r(S, 8, ColNum8, Diagonalr8),
    coluna(S, 8, Coluna8),
    sozinhaLinha(Diagonal8),
    sozinhaLinha(Diagonalr8),
    sozinhaLinha(Coluna8), !.