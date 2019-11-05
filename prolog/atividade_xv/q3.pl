% questao 3

% ?- divisivel(7, 3). -> false.
% ?- divisivel(12, 3). -> true .

divisivel(0, _).
divisivel(X, Y) :- R is X-Y, R >= 0, divisivel(R, Y).