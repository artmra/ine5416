% questao 5

% ?- eqSegundoGrau(1, 2, 1, X). -> X = -1.
% ?- eqSegundoGrau(2, 13, 24, X). -> X = -2.227998127341235.

delta(A, B, C, D) :- V is (B * B), T is (4 * A * C), D is (V - T).
eqSegundoGrau(A, B, C, ValorX) :- Div is (2 * A), delta(A, B, C, D), Sq is sqrt(D), Bm is -B, Divn is (Bm + Sq), ValorX is (Divn/Div).