% ['/home/evaristo-mosby/Desktop/ine5416/prolog/atividade_xviii/q1.pl'].


% ?- distancia(ponto(1,1), ponto(4,5), Dist).
% Dist = 5.0.

distancia(ponto(X1, Y1), ponto(X2, Y2), Dist) :- Dist is sqrt((X2 - X1)^2 + (Y2 - Y1)^2).

% ?- colineares(ponto(2, 1), ponto(0, -3), ponto(-2, -7)).
% true.

colineares(ponto(X1, Y1), ponto(X2, Y2), ponto(X3, Y3)) :- ((X1*Y2) + (Y1*X3) + (X2*X3) - (Y1*X2) - (X1*Y3) - (Y2*X3)) =:= 0.

abs(X, Y) :- X < 0, Y is (-X).
abs(X, X) :- X >= 0.

formaTriangulo(ponto(X1, Y1), ponto(X2, Y2), ponto(X3, Y3)) :- distancia(ponto(X1, Y1), ponto(X2, Y2), A),
															   distancia(ponto(X1, Y1), ponto(X3, Y3), B),
															   distancia(ponto(X2, Y2), ponto(X3, Y3), C),
															   B_C is (B - C), A_C is (A - C), A_B is (A - B),
															   abs(B_C, B_C_), abs(A_C, A_C_), abs(A_B, A_B_),
															   BmC is (B + C), AmC is (A + C), AmB is (A + B),
															   A > B_C_, A < BmC, 
															   B > A_C_, B < AmC,
															   C > A_B_, C < AmB. 