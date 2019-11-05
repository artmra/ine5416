% questao 18

% ?- coprimos(20, 17). -> true.
% ?- coprimos(20, 10). -> false.

mdc(X, Y, Resultado) :- X = Y, Resultado = X.
mdc(X, Y, Resultado) :- X < Y, Y1 is Y - X, mdc(X, Y1, Resultado).
mdc(X, Y, Resultado) :- X > Y, mdc(Y, X, Resultado).

coprimos(X,Y) :- mdc(X, Y, Resultado), Resultado is 1.