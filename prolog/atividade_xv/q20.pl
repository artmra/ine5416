% questao 20

% ?- primo(13). -> true.

mdc(X, Y, Resultado) :- X = Y, Resultado = X.
mdc(X, Y, Resultado) :- X < Y, Y1 is Y - X, mdc(X, Y1, Resultado).
mdc(X, Y, Resultado) :- X > Y, mdc(Y, X, Resultado).

coprimos(X,Y) :- mdc(X, Y, Resultado), Resultado is 1.

totienteEulerCont(N, N, K) :- K is 0.
totienteEulerCont(N, C, K) :- C_1 is (C + 1), totienteEulerCont(N, C_1, K_), (coprimos(N, C) -> K is (K_ + 1); K is K_).

totienteEuler(1, K) :- K is 1.
totienteEuler(N, K) :- totienteEulerCont(N, 1, K).

primo(N) :- Expected_K is (N - 1), totienteEuler(N, K_), K_ = Expected_K.