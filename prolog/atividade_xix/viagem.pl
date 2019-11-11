% ['/home/evaristo-mosby/Desktop/ine5416/prolog/atividade_xix/viagem.pl'].

nome(cristian).
nome(ederson).
nome(henrique).
nome(rafael).

cidade(orlando).
cidade(lasVegas).
cidade(novaYork).
cidade(saoFrancisco).

duracao(10).
duracao(15).
duracao(20).
duracao(25).

hotel(bestPrice).
hotel(bigPalace).
hotel(gardenFlowers).
hotel(niceSpring).

% X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
% X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.
                        
% X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

% X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solve(S) :-
	
	S = [
		pessoa(Nome1, Cidade1, Duracao1, Hotel1),
		pessoa(Nome2, Cidade2, Duracao2, Hotel2),
		pessoa(Nome3, Cidade3, Duracao3, Hotel3),
		pessoa(Nome4, Cidade4, Duracao4, Hotel4)
	],
	
	% O turista que viajara por 20 dias nos EUA ficara hospedado no hotel bigPalace
	member(pessoa(_, _, 20, bigPalace), S),

	% Quem ficara hospedado no hotel bestPrice eh o turista cristian ou o turista que viajara por 10 dias
	(member(pessoa(cristian, _, _, bestPrice), S); member(pessoa(_, _, 10, bestPrice), S)),

	% Sobre o turista que vai pra orlando e o que vai ficar no hotel niceSpring, um vai viajar durante 20 dias e o outro se chama henrique(nao necessariamente nessa ordem)
	((member(pessoa(_, orlando, 20, _), S), member(pessoa(henrique, _, _, niceSpring), S)) ; (member(pessoa(henrique, orlando, _, _), S), member(pessoa(_, _, 20, niceSpring), S))),
	
	% O turista que vai para novaYork ficara 10 dias a mais nos EUA que rafael
	% ((member(pessoa(_, novaYork, 20, _), S), member(pessoa(rafael, _, 10, _), S)); (member(pessoa(_, novaYork, 25, _), S), member(pessoa(rafael, _, 15, _), S))),
	member(pessoa(_, novaYork, D1, _), S), member(pessoa(rafael, _, D2, _), S), duracao(D1), duracao(D2), D1 - D2 =:= 10,
	
	% henrique viajara 5 dias e menos que o turista que vai para saoFrancisco
	% ((member(pessoa(henrique, _, 10, _), S), member(pessoa(_, saoFrancisco, 15, _), S)); (member(pessoa(henrique, _, 15, _), S), member(pessoa(_, saoFrancisco, 20, _), S)); (member(pessoa(henrique, _, 20, _), S), member(pessoa(_, saoFrancisco, 25, _), S))),
	member(pessoa(henrique, _, D3, _), S), member(pessoa(_, saoFrancisco, D4, _), S), duracao(D3), duracao(D4), D4 - D3 =:= 5,

	nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4),
	todosDiferentes([Nome1, Nome2, Nome3, Nome4]),

	cidade(Cidade1), cidade(Cidade2), cidade(Cidade3), cidade(Cidade4),
	todosDiferentes([Cidade1, Cidade2, Cidade3, Cidade4]),

	duracao(Duracao1), duracao(Duracao2), duracao(Duracao3), duracao(Duracao4),
	todosDiferentes([Duracao1, Duracao2, Duracao3, Duracao4]),

	hotel(Hotel1), hotel(Hotel2), hotel(Hotel3), hotel(Hotel4),
	todosDiferentes([Hotel1, Hotel2, Hotel3, Hotel4]).

