% ['/home/evaristo-mosby/Desktop/ine5416/prolog/atividade_xix/dados.pl'].

lado(1).
lado(2).
lado(3).
lado(4).
lado(5).
lado(6).

resultado(0, []) :- !.
resultado(N, [H|Resto]) :- lado(H),
						   N1 is N - 1,
						   resultado(N1, Resto).

solucao(N, L) :- resultado(N,L).

soma([], 0) :- !.
soma([H|T], Valor) :- soma(T, Valor_), Valor is H + Valor_.

% findall(P, solucao(3, P), Possibilidades), sort(Possibilidades, SemIguais).
% Possibilidades = SemIguais, SemIguais = [[1, 1, 1], [1, 1, 2], [1, 1, 3], [1, 1, 4], [1, 1, 5], [1, 1, 6], [1, 2|...], [1|...], [...|...]|...].

% findall(P, (solucao(3, P), soma(P, Valor), Valor =:= 4), Possibilidades).
% Possibilidades = [[1, 1, 2], [1, 2, 1], [2, 1, 1]].