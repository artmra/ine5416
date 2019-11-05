% questao 7

% ?- abs(-1, R). -> R = 1.
% ?- abs(1, R). -> R = 1.

abs(X, Y) :- X < 0 -> Y is -X; Y is X.