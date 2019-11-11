% ['/home/evaristo-mosby/Desktop/ine5416/prolog/atividade_xix/x_rainhas.pl'].

rainha(1).
rainha(2).
rainha(3).
rainha(4).
rainha(5).
rainha(6).
rainha(7).
rainha(8).
rainha(9).
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

diagonal_parte_superior(Lista, 1, ColNum, Diagonal) :- linha(Lista, 1, Linha),
                                                         (leng(Lista, Leng), ((RowNum > Leng); (ColNum < 0)), Diagonal = [], !);
                                                         n_elemento(Linha, ColNum, Elemento), Diagonal = [Elemento], !.
diagonal_parte_superior(Lista, RowNum, ColNum, Diagonal) :- (leng(Lista, Leng), ColNum < 1, Diagonal = []);
                                                            linha(Lista, RowNum, Linha),
                                                            n_elemento(Linha, ColNum, Elemento),
                                                            RowNum_ is (RowNum - 1),
                                                            ColNum_ is (ColNum - 1),
                                                            diagonal_parte_superior(Lista, RowNum_, ColNum_, H),
                                                            concat(H, [Elemento], Diagonal).

diagonal_parte_superior_r(Lista, 1, ColNum, Diagonal) :- (leng(Lista, Leng), ((RowNum > Leng); (ColNum > Leng)), Diagonal = [], !);
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

% diagonal_r([[" ", " ", " ", 1, " "], [" ", " ", 2 , " ", " "], [" ", " ", " ", 1, " "], [" ", " ", " ", 4, " "], [" ", " ", 3, 1, " "]], 3, 4, Diagonal).
