% questao 11

% ?- primeiros(2, [1, 2, 3], L). -> L = [1, 2].
% ?- primeiros(1, [1, 2, 3], L). -> L = [1].


primeiros(0,_,[]) :- !.
primeiros(N, [H|T], L2) :- N1 is (N - 1), primeiros(N1, T, L2), L2 = [H|L2].