% questao 10

% ?- aprovado(1, 3, 8). -> false.
% ?- aprovado(6, 7, 8). -> true.

aprovado(A, B, C) :- Media is (A + B + C)/3, Media >= 6.