% questao 4

abs(X, Y) :- X < 0 -> Y is -X; Y is X.

% ?- triangulo(8, 10, 14). -> true.
% ?- triangulo(8, 5, 14). -> false.

triangulo(A, B, C) :- abs(B - C, B_C), abs(A - C, A_C), abs(A - B, A_B), B_C < A, A < (B + C), A_C < B, B < (A + C), A_B < C, C < (A + B).