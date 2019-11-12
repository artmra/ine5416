% questao 4

% ?- soma([1, 2, 3, 4, 5, 6, 7, 8, 9], X). -> X = 45.
% ?- soma([1, 2, 3], X). -> X = 6.

soma([],0).
soma([H|T], X) :- soma(T, X_), X is (H + X_).