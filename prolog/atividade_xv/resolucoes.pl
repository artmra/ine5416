% questao 3

% ?- divisivel(7, 3). -> false.
% ?- divisivel(12, 3). -> true .

divisivel(0, _).
divisivel(X, Y) :- R is X-Y, R >= 0, divisivel(R, Y).

% _________________________________________________________________________________________________________________________________________

% questao 4

abs(X, Y) :- X < 0 -> Y is -X; Y is X.

% ?- triangulo(8, 10, 14). -> true.
% ?- triangulo(8, 5, 14). -> false.

triangulo(A, B, C) :- abs(B - C, B_C), abs(A - C, A_C), abs(A - B, A_B), B_C < A, A < (B + C), A_C < B, B < (A + C), A_B < C, C < (A + B).

% _________________________________________________________________________________________________________________________________________

% questao 5

% ?- eqSegundoGrau(1, 2, 1, X). -> X = -1.
% ?- eqSegundoGrau(2, 13, 24, X). -> X = -2.227998127341235.

delta(A, B, C, D) :- V is (B * B), T is (4 * A * C), D is (V - T).
eqSegundoGrau(A, B, C, ValorX) :- Div is (2 * A), delta(A, B, C, D), Sq is sqrt(D), Bm is -B, Divn is (Bm + Sq), ValorX is (Divn/Div).

% _________________________________________________________________________________________________________________________________________

% questao 6

% ?- potencia(5, 0, R). -> R = 1 .
% ?- potencia(3, 0, R). -> R = 1 .
% ?- potencia(2, 10, R). -> R = 1024 .

potencia(_, 0, 1).
potencia(X, Y, Result) :- New_Y is (Y - 1), potencia(X, New_Y, Result_), Result is (X * Result_).

% _________________________________________________________________________________________________________________________________________

% questao 7

	% ja esta feito na questao do triangulo:
		% ?- abs(-1, R). -> R = 1.
		% ?- abs(1, R). -> R = 1.
% _________________________________________________________________________________________________________________________________________

% questao 8

% ?- area_triangulo(10, 2, Area). -> Area = 10.
% ?- area_triangulo(6, 4, Area). -> Area = 12.

area_triangulo(B, H, Area) :- B_H is (B * H), Area is (B_H/2).

% _________________________________________________________________________________________________________________________________________

% questao 9

% ?- xor_(true,false). -> true .
% ?- xor_(true,true). -> false.
% ?- xor_(false,true). -> true.
% ?- xor_(false,false). -> false.

xor_(A, B) :- (A, not(B));(not(A), B).

% _________________________________________________________________________________________________________________________________________

% questao 10

% ?- aprovado(1, 3, 8). -> false.
% ?- aprovado(6, 7, 8). -> true.

aprovado(A, B, C) :- Media is (A + B + C)/3, Media >= 6.

% _________________________________________________________________________________________________________________________________________

% questao 11

% ?- fib(10, K). -> 55.
fib(0, 0).
fib(1, 1).
fib(N, K) :- N1 is (N - 1), N2 is (N -2), fib(N1, Fib1), fib(N2, Fib2), K is Fib1 + Fib2. 

% _________________________________________________________________________________________________________________________________________

% questao 12

% ?- distancia3D(ponto(1, 1, 0), ponto(3, 3, 1), Dist). -> Dist = 3.0.

distancia3D(ponto(X1,Y1,Z1),ponto(X2,Y2,Z2),  Dist) :- X is (X1 - X2), X_ is (X * X), Y is (Y1 - Y2), Y_ is (Y * Y), Z is (Z1 - Z2), Z_ is (Z * Z), Soma is (X_ + Y_ + Z_), Dist is sqrt(Soma).

% _________________________________________________________________________________________________________________________________________

% questao 13

% ?- maior(10, 12, 11, X). -> X = 12.
% ?- maior(10, 3, 11, X). -> X = 11.
% ?- maior(15, 12, 11, X). -> X = 15.
% ?- maior(1805, 10002, 11765, X). -> X = 11765.

maior(A, B, C, X) :- (A > B, A > C) -> X is A; (B > C) -> X is B; X is C.

% _________________________________________________________________________________________________________________________________________

% questao 14

% ?- operacao(/, 10, 5, Resultado). -> Resultado = 2.
% ?- operacao(/, 10, 3, Resultado). -> Resultado = 3.3333333333333335.
% ?- operacao(/, 12, 3, Resultado). -> Resultado = 4.


operacao(+,X,Y,Resultado) :- Resultado is (X + Y).
operacao(-,X,Y,Resultado) :- Resultado is (X - Y).
operacao(*,X,Y,Resultado) :- Resultado is (X * Y).
operacao(/,X,Y,Resultado) :- Resultado is (X / Y).

% _________________________________________________________________________________________________________________________________________

% questao 15

% ?- mdc(23732, 180, Resultado). -> Resultado = 4.
% ?- mdc(237, 180, Resultado). -> Resultado = 3.

mdc(X, Y, Resultado) :- X = Y, Resultado = X.
mdc(X, Y, Resultado) :- X < Y, Y1 is Y - X, mdc(X, Y1, Resultado).
mdc(X, Y, Resultado) :- X > Y, mdc(Y, X, Resultado).

% _________________________________________________________________________________________________________________________________________

% questao 16

% ?- mdc_(23732, 180, 270, Resultado). -> Resultado = 2.
% ?- mdc_(819, 357, 14, Resultado). -> Resultado = 7.

mdc_(A, B, C, Resultado) :- mdc(A, B, Resultado1), mdc(Resultado1, C, Resultado).

% _________________________________________________________________________________________________________________________________________

% questao 17

% ?- mmc(21, 6, Resultado). -> 42
% ?- mmc(38, 10, Resultado). -> 190

mmc(A, B, Resultado) :- mdc(A, B, Mdc), A_B is (A * B), Resultado is (A_B/Mdc).

% _________________________________________________________________________________________________________________________________________

% questao 18

% ?- coprimos(20, 17). -> true.
% ?- coprimos(20, 10). -> false.

coprimos(X,Y) :- mdc(X, Y, Resultado), Resultado is 1.
% _________________________________________________________________________________________________________________________________________

% questao 19

% ?- totienteEuler(9, K). -> K = 6 .
% ?- totienteEuler(10, K). -> K = 4 .


totienteEulerCont(N, N, K) :- K is 0.
totienteEulerCont(N, C, K) :- C_1 is (C + 1), totienteEulerCont(N, C_1, K_), (coprimos(N, C) -> K is (K_ + 1); K is K_).

totienteEuler(1, K) :- K is 1.
totienteEuler(N, K) :- totienteEulerCont(N, 1, K).

% _________________________________________________________________________________________________________________________________________

% questao 20

% ?- primo(13). -> true.
primo(N) :- Expected_K is (N - 1), totienteEuler(N, K_), K_ = Expected_K.