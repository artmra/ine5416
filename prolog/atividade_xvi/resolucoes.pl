% questao 1

% ?- posicao(1, [1, 2, 3, 4], P). -> P = 0.
% ?- posicao(2, [1, 2, 3, 4], P). -> P = 1.

posicao(X,[X|_],P) :- P is 0, !.
posicao(X,[_|T],P) :- posicao(X, T, P1), P is P1+1.

%________________________________________________________________________________
% questao 2

% ?- inserirElementoPosicao(3, 1, [1, 2, 3], L). -> L = [1, 3, 2, 3].
% ?- inserirElementoPosicao(3, 2, [1, 2, 3], L). -> L = [1, 2, 3, 3].

inserirElementoPosicao(X, 0, L1, L2) :- append([X], L1, L2), !.
inserirElementoPosicao(X, P, [H|T], L2) :- Pm1 is P-1, inserirElementoPosicao(X, Pm1, T, L2rec), append([H], L2rec, L2).

%________________________________________________________________________________
% questao 3

% ?- inserirElementoPosicao(3, 1, [1, 2, 3], L). -> L = [1, 3, 2, 3].
% ?- inserirElementoPosicao(3, 2, [1, 2, 3], L). -> L = [1, 2, 3, 3].

numerosParaPalavras([], []).
numerosParaPalavras([1|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Um"|L2aux].
numerosParaPalavras([2|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Dois"|L2aux].
numerosParaPalavras([3|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Três"|L2aux]. 
numerosParaPalavras([4|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Quatro"|L2aux].
numerosParaPalavras([5|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Cinco"|L2aux].
numerosParaPalavras([6|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Seis"|L2aux].
numerosParaPalavras([7|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Sete"|L2aux].
numerosParaPalavras([8|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Oito"|L2aux]. 
numerosParaPalavras([9|T], L2) :- numerosParaPalavras(T, L2aux), L2 = ["Nove"|L2aux].

%________________________________________________________________________________
% questao 4

% ?- soma([1, 2, 3, 4, 5, 6, 7, 8, 9], X). -> X = 45.
% ?- soma([1, 2, 3], X). -> X = 6.

soma([],0).
soma([H|T], X) :- soma(T, Xac), X is H+Xac.

%________________________________________________________________________________
% questao 5

% ?- media([], M). -> M = 0.
% ?- media([1, 2, 3], M). -> M = 2.

soma([],0).
soma([H|T], X) :- soma(T, Xac), X is H+Xac.

comprimento([], 0).
comprimento([_|T], C) :- comprimento(T, Cr), C is Cr+1.

media([], 0) :- !.
media(L,X) :- soma(L, Soma), comprimento(L, Comprimento), X is Soma/Comprimento.


%________________________________________________________________________________
% questao 6

% ?- menor([2, 3, 4, 5, 0], M). -> M = 0.
% ?- menor([2, 3, 4, 5], M). -> M = 2.

menor([H], H) :- !.
menor([H|T],X) :- menor(T, MTail), (MTail < H -> X is MTail ; X is H).

%________________________________________________________________________________
% questao 7

% ?- palindrome([1, 2, 3, 4, 3, 2]). -> false.
% ?- palindrome([1, 2, 3, 4, 3, 2, 1]). -> true.

ultimo([H], H) :- !.
ultimo([_|T], L) :- ultimo(T, L).

menosUltimo([_], []) :- !.
menosUltimo([H|T], L) :- menosUltimo(T, L1), L = [H | L1].

palindrome([_]) :- true, !.
palindrome([]) :- true, !.
palindrome([H|T]) :- ultimo(T, L), H = L, menosUltimo(T, TmU), palindrome(TmU).

%________________________________________________________________________________
% questao 8

% ?- diferencaMaiorMenor([1, 2, 3, 4], M). -> M = 3.
% ?- diferencaMaiorMenor([1, 2, 3, 4, 321], M). -> M = 320

menor([H], H) :- !.
menor([H|T],X) :- menor(T, MTail), (MTail < H -> X is MTail ; X is H).

maior([H], H) :- !.
maior([H|T],X) :- maior(T, MTail), (MTail > H -> X is MTail ; X is H).


diferencaMaiorMenor(L,X) :- maior(L, Maior), menor(L, Menor), X is Maior-Menor.

%________________________________________________________________________________
% questao 9

% ?- ocorrencias([1, 2, 3, 4, 3, 2, 1], 1, X). -> X = 2.
% ?- ocorrencias([1, 2, 3, 4, 3, 2, 1], 4, X). -> X = 1.

ocorrencias([], _, 0).
ocorrencias([H|T], X, N) :- ocorrencias(T, X, Ct), (X = H -> N is Ct+1 ; N is Ct).

%________________________________________________________________________________
% questao 10

% ?- inverter([1, 2, 3, 4], X). -> X = [4, 3, 2, 1].

inverter([H], [H]) :- !.
inverter(L1, L2) :- ultimo(L1, U), menosUltimo(L1, MU), inverter(MU, MLU), L2 = [U | MLU].

ultimo([H], H) :- !.
ultimo([_|T], L) :- ultimo(T, L).

menosUltimo([_], []) :- !.
menosUltimo([H|T], L) :- menosUltimo(T, L1), L = [H | L1].

%________________________________________________________________________________
% questao 11

% ?- primeiros(2, [1, 2, 3], L). -> L = [1, 2].
% ?- primeiros(1, [1, 2, 3], L). -> L = [1].


primeiros(0,_,[]) :- !.
primeiros(N, [H|T], L2) :- Nm1 is N-1, primeiros(Nm1, T, L2m), L2 = [H|L2m].

%________________________________________________________________________________
% questao 12

% ?- apagar(0, [1, 2 , 3], L). -> L = [1, 2, 3].
% ?- apagar(1, [1, 2 , 3], L). -> L = [2, 3].

apagar(0, L1, L1) :- !.
apagar(N, [_|T], L2) :- Nm1 is N-1, apagar(Nm1, T, L2).

%________________________________________________________________________________
% questao 13

% ?- dividir([1, 2 , 3, 4], L2, L3). -> L2 = [1, 2], L3 = [3, 4].

% ?- dividir([1, 2 , 3, 4, 5], L2, L3). -> L2 = [1, 2, 3], L3 = [4, 5].

comprimento([],0).
comprimento([_|T],C) :- comprimento(T,CT), C is CT + 1.

primeiros(0,_,[]) :- !.
primeiros(N, [H|T], L2) :- Nm1 is N-1, primeiros(Nm1, T, L2m), L2 = [H|L2m].

apagar(0, L1, L1) :- !.
apagar(N, [_|T], L2) :- Nm1 is N-1, apagar(Nm1, T, L2).

dividir(L1,L2,L3) :- comprimento(L1, C1),
                     CL3 is div(C1, 2),
                     CL2 is C1-CL3,
                     primeiros(CL2, L1, L2),
                     apagar(CL2, L1, L3).

%________________________________________________________________________________
% questao 14

% ?- uniao([1, 2, 3, 5], [2, 3, 4], L). -> L = [1, 5, 2, 3, 4] .

membro(_, []) :- false.
membro(X,[X|_]) :- !.
membro(X,[_|T]) :- membro(X,T).

concatena([],L,L).
concatena([H|T],L2,[H|LContatenada]) :- concatena(T,L2,LContatenada).

listaParaConjunto([],[]).
listaParaConjunto([H|T],[H|L]):- not(membro(H,T)), listaParaConjunto(T,L).
listaParaConjunto([H|T],L):- membro(H,T), listaParaConjunto(T,L).

uniao(S1, S2, S3) :- concatena(S1, S2, SS3), listaParaConjunto(SS3, S3).
%________________________________________________________________________________
% questao 15

% ?- diferenca([1, 2, 3, 5], [2, 3, 4], L). -> L = [1, 5].

membro(X,[X|_]) :- !.
membro(X,[_|T]) :- membro(X,T).

diferenca([], _, []).
diferenca([H|T], S2, S3) :- membro(H, S2) ->
                                diferenca(T, S2, S3) 
                            ;
                                diferenca(T, S2, SS3), S3 = [H|SS3].

%________________________________________________________________________________
% questao 16

% ?- interseccao([1, 2, 3, 5], [2, 3, 4], [2, 6, 7], L). -> L = [2].
% ?- uniao([1, 2, 3, 5], [2, 3, 4], [2, 6, 7], L). -> L = [1, 5, 3, 4, 2, 6, 7] .
% ?- diferenca([1, 2, 3, 5], [2, 3, 4], [2, 6, 7], L). -> L = [1, 5].

membro(X,[X|_]) :- !.
membro(X,[_|T]) :- membro(X,T).

interseccao([], _, []) :- !.
interseccao([H|T], S2, S3) :- membro(H, S2) ->
                                    interseccao(T, S2, SS3), S3 = [H|SS3]
                              ;
                                    interseccao(T, S2, S3).


diferenca([], _, []).
diferenca([H|T], S2, S3) :- membro(H, S2) ->
                            diferenca(T, S2, S3) 
                        ;
                            diferenca(T, S2, SS3), S3 = [H|SS3].


concatena([],L,L).
concatena([H|T],L2,[H|LContatenada]) :- concatena(T,L2,LContatenada).
                                                    
listaParaConjunto([],[]).
listaParaConjunto([H|T],[H|L]):- not(membro(H,T)), listaParaConjunto(T,L).
listaParaConjunto([H|T],L):- membro(H,T), listaParaConjunto(T,L).

uniao(S1, S2, S3) :- concatena(S1, S2, SS3), listaParaConjunto(SS3, S3).

uniao(S1, S2, S3, S4) :- uniao(S1, S2, SS3), uniao(SS3, S3, S4).
interseccao(S1, S2, S3, S4) :- interseccao(S1, S2, SS3), interseccao(SS3, S3, S4).
diferenca(S1, S2, S3, S4) :- diferenca(S1, S2, SS3), diferenca(SS3, S3, S4).
