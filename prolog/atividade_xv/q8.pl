% questao 8

% ?- area_triangulo(10, 2, Area). -> Area = 10.
% ?- area_triangulo(6, 4, Area). -> Area = 12.

area_triangulo(B, H, Area) :- B_H is (B * H), Area is (B_H/2).