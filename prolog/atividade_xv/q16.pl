% questao 16

% ?- mdc(23732, 180, 270, Resultado). -> Resultado = 2.
% ?- mdc(819, 357, 14, Resultado). -> Resultado = 7.

mdc_(X, Y, Resultado) :- X = Y, Resultado = X.
mdc_(X, Y, Resultado) :- X < Y, Y1 is Y - X, mdc_(X, Y1, Resultado).
mdc_(X, Y, Resultado) :- X > Y, mdc_(Y, X, Resultado).

mdc(A, B, C, Resultado) :- mdc_(A, B, Resultado1), mdc_(Resultado1, C, Resultado).