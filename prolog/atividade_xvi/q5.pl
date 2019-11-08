% questao 5

% ?- media([], M). -> M = 0.
% ?- media([1, 2, 3], M). -> M = 2.

soma([],0).
soma([H|T], X) :- soma(T, X_), X is (H + X_).

comprimento([], 0).
comprimento([_|T], C) :- comprimento(T, C_), C is (C_ + 1).

media([], 0) :- !.
media(L,X) :- soma(L, Soma), comprimento(L, Comprimento), X is Soma/Comprimento.