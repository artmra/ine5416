% questao 15

% ?- mdc(23732, 180, Resultado). -> Resultado = 4.
% ?- mdc(237, 180, Resultado). -> Resultado = 3.

mdc(X, Y, Resultado) :- X = Y, Resultado = X.
mdc(X, Y, Resultado) :- X < Y, Y1 is Y - X, mdc(X, Y1, Resultado).
mdc(X, Y, Resultado) :- X > Y, mdc(Y, X, Resultado).