% questao 3

% ?- inserirElementoPosicao(3, 1, [1, 2, 3], L). -> L = [1, 3, 2, 3].
% ?- inserirElementoPosicao(3, 2, [1, 2, 3], L). -> L = [1, 2, 3, 3].

numerosParaPalavras([], []).
numerosParaPalavras([1|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Um"|L2_].
numerosParaPalavras([2|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Dois"|L2_].
numerosParaPalavras([3|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Três"|L2_]. 
numerosParaPalavras([4|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Quatro"|L2_].
numerosParaPalavras([5|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Cinco"|L2_].
numerosParaPalavras([6|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Seis"|L2_].
numerosParaPalavras([7|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Sete"|L2_].
numerosParaPalavras([8|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Oito"|L2_]. 
numerosParaPalavras([9|T], L2) :- numerosParaPalavras(T, L2_), L2 = ["Nove"|L2_].