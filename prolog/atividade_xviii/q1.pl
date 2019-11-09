% ['/home/evaristo-mosby/Desktop/ine5416/prolog/atividade_xviii/q1.pl'].


% ?- distancia(ponto(1,1), ponto(4,5), Dist).
% Dist = 5.0.

distancia(ponto(X1, Y1), ponto(X2, Y2), Dist) :- Dist is sqrt((X2 - X1)^2 + (Y2 - Y1)^2).

% ?- colineares(ponto(2, 1), ponto(0, -3), ponto(-2, -7)).

colineares(ponto(X1, Y1), ponto(X2, Y2), ponto(X3, Y3)) :- ((X1*Y2) + (Y1*X3) + (X2*X3) - (Y1*X2) - (X1*Y3) - (Y2*X3)) =:= 0.

