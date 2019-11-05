% questao 6

% ?- potencia(5, 0, R). -> R = 1 .
% ?- potencia(3, 0, R). -> R = 1 .
% ?- potencia(2, 10, R). -> R = 1024 .

potencia(_, 0, 1).
potencia(X, Y, Result) :- New_Y is (Y - 1), potencia(X, New_Y, Result_), Result is (X * Result_).