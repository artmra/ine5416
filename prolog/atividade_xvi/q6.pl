% questao 6

% ?- menor([2, 3, 4, 5, 0], M). -> M = 0.
% ?- menor([2, 3, 4, 5], M). -> M = 2.

menor([H], H) :- !.
menor([H|T],X) :- menor(T, M_t), (M_t < H -> X is M_t ; X is H).