:- initialization(main).
fatorial(1,1).
fatorial(N,K) :- N1 is N - 1, fatorial(N1, K1), K is N * K1.

main :- write('Informe um número: '),
		read(K),
		write('Fatorial de '),
		write(K),
		write(' eh '),
		fatorial(K, X),
		writeln(X),
		halt.