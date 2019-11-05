% questao 11

% ?- fib(10, K). -> 55.
fib(0, 0).
fib(1, 1).
fib(N, K) :- N1 is (N - 1), N2 is (N -2), fib(N1, Fib1), fib(N2, Fib2), K is Fib1 + Fib2.