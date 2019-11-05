% questao 14

% ?- operacao(/, 10, 5, Resultado). -> Resultado = 2.
% ?- operacao(/, 10, 3, Resultado). -> Resultado = 3.3333333333333335.
% ?- operacao(/, 12, 3, Resultado). -> Resultado = 4.


operacao(+,X,Y,Resultado) :- Resultado is (X + Y).
operacao(-,X,Y,Resultado) :- Resultado is (X - Y).
operacao(*,X,Y,Resultado) :- Resultado is (X * Y).
operacao(/,X,Y,Resultado) :- Resultado is (X / Y).