% questao 9

% ?- ocorrencias([1, 2, 3, 4, 3, 2, 1], 1, X). -> X = 2.
% ?- ocorrencias([1, 2, 3, 4, 3, 2, 1], 4, X). -> X = 1.

ocorrencias([], _, 0).
ocorrencias([H|T], X, N) :- ocorrencias(T, X, C_t), (X = H -> N is (C_t + 1) ; N is C_t).