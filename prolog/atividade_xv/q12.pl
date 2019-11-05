% questao 12

% ?- distancia3D(ponto(1, 1, 0), ponto(3, 3, 1), Dist). -> Dist = 3.0.

distancia3D(ponto(X1,Y1,Z1),ponto(X2,Y2,Z2),  Dist) :- X is (X1 - X2), X_ is (X * X), Y is (Y1 - Y2), Y_ is (Y * Y), Z is (Z1 - Z2), Z_ is (Z * Z), Soma is (X_ + Y_ + Z_), Dist is sqrt(Soma).