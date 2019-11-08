distancia(ponto(X1, Y1), ponto(X3, Y3), Dist) :- X1_X2 is (X2 - X1),
                                                 Y1_Y2 is (Y2 - Y1),
                                                 Dist is sqrt(X1_X2 ^ 2 - Y1_Y2 ^ 2).

colineares(ponto(X1, Y1), ponto(X2, Y2), ponto(X3, Y3)) :-
    Dist is (X1 * Y2) + (Y2 * X3) + ()