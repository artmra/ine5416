% questao 8

% ?- diferencaMaiorMenor([1, 2, 3, 4], M). -> M = 3.
% ?- diferencaMaiorMenor([1, 2, 3, 4, 321], M). -> M = 320

menor([H], H) :- !.
menor([H|T],X) :- menor(T, M_t), (M_t < H -> X is M_t ; X is H).

maior([H], H) :- !.
maior([H|T],X) :- maior(T, M_t), (M_t > H -> X is M_t ; X is H).


diferencaMaiorMenor(L,X) :- maior(L, Maior), menor(L, Menor), X is (Maior - Menor).