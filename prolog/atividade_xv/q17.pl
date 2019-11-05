% questao 17

% ?- mmc(21, 6, Resultado). -> 42
% ?- mmc(38, 10, Resultado). -> 190

mdc(X, Y, Resultado) :- X = Y, Resultado = X.
mdc(X, Y, Resultado) :- X < Y, Y1 is Y - X, mdc(X, Y1, Resultado).
mdc(X, Y, Resultado) :- X > Y, mdc(Y, X, Resultado).

mmc(A, B, Resultado) :- mdc(A, B, Mdc), A_B is (A * B), Resultado is (A_B/Mdc).