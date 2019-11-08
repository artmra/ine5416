bolsa(amarela).
bolsa(azul).
bolsa(branca).
bolsa(verde).
bolsa(vermelha).

nome(adriana).
nome(cecilia).
nome(iara).
nome(poliana).
nome(sabrina).

idade(20).
idade(28).
idade(33).
idade(45).
idade(56).

pintor(brasileiro).
pintor(espanhol).
pintor(frances).
pintor(holandes).
pintor(italiano).

hora(900).
hora(930).
hora(1000).
hora(1030).
hora(1100).

transporte(bicicleta).
transporte(carro).
transporte(metro).
transporte(onibus).
transporte(trem).

%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista); nextto(Y,X,Lista).
                       
%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.
                        
%X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

%X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

% pessoa(_, _, _, _, _, _)
% ['/home/evaristo-mosby/Desktop/ine5416/trabalho_2/trabalho2.pl'].

solucao(S) :-
    S = [
        pessoa(Bolsa1, Nome1, Idade1, Pintor1, Hora1, Transporte1),
        pessoa(Bolsa2, Nome2, Idade2, Pintor2, Hora2, Transporte2),
        pessoa(Bolsa3, Nome3, Idade3, Pintor3, Hora3, Transporte3),
        pessoa(Bolsa4, Nome4, Idade4, Pintor4, Hora4, Transporte4),
        pessoa(Bolsa5, Nome5, Idade5, Pintor5, Hora5, Transporte5)
    ],

    % Sabrina está em algum lugar entre a dona da bolsa Amarela e a visitante que gosta do pintor Francês, nessa ordem.
    aEsquerda(pessoa(amarela, _, _, _, _, _), pessoa(_, sabrina, _, _, _, _), S),
    aDireita(pessoa(_, _, _, frances, _, _), pessoa(_, sabrina, _, _, _, _), S),

    % Na primeira posição está quem foi de Trem.
    Transporte1 = trem,

    % A visitante mais velha está em algum lugar à direita da visitante da bolsa Azul
    aDireita(pessoa(_, _, 56, _, _, _), pessoa(azul, _, _, _, _, _), S),

    % A mulher que chegou às 10:00 está ao lado da visitante que gosta do pintor Brasileiro.
    aoLado(pessoa(_, _, _, _, 1000, _), pessoa(_, _, _, brasileiro, _, _), S),

    % A visitante de 28 anos está em algum lugar entre a dona da bolsa Branca e a mulher mais nova, nessa ordem.
    aEsquerda(pessoa(branca, _, _, _, _, _), pessoa(_, _, 28, _, _, _), S), aDireita(pessoa(_, _, 20, _, _, _), pessoa(_, _, 28, _, _, _), S),

    % A dona da bolsa Azul está em algum lugar à esquerda de quem chegou às 10:30.
    aEsquerda(pessoa(azul, _, _, _, _, _), pessoa(_, _, _, _, 1030, _), S),

    % Quem foi de Metrô está ao lado de quem gosta do pintor Brasileiro.
    aoLado(pessoa(_, _, _, _, _, metro), pessoa(_, _, _, brasileiro, _, _), S),

    % Adriana está ao lado de quem foi de Bicicleta.
    aoLado(pessoa(_, adriana, _, _, _, _), pessoa(_, _, _, _, _, bicicleta), S),

    % Cecília está em uma das pontas.
    noCanto(pessoa(_, cecilia, _, _, _, _), S),

    % A visitante que gosta do pintor Brasileiro está em algum lugar entre a mulher de 45 anos e a mulher que gosta do pintor Italiano, nessa ordem.
    aEsquerda(pessoa(_, _, 45, _, _, _), pessoa(_, _, _, brasileiro, _, _), S), aDireita(pessoa(_, _, _, italiano, _, _), pessoa(_, _, _, brasileiro, _, _), S),

    % A mulher de 33 anos está ao lado da mulher que foi de Ônibus para a exposição.
    aoLado(pessoa(_, _, 33, _, _, _), pessoa(_, _, _, _, _, onibus), S),

    % A visitante da bolsa Verde gosta do pintor Francês.
    member(pessoa(verde, _, _, frances, _, _), S),

    % Quem foi de Carro está ao lado de quem chegou às 10:00.
    aoLado(pessoa(_, _, _, _, _, carro), pessoa(_, _, _, _, 1000, _), S),

    % Poliana está em algum lugar à direita da mulher de bolsa Azul.
    aDireita(pessoa(_, poliana, _, _, _, _), pessoa(azul, _, _, _, _, _), S),

    % Quem foi de Bicicleta está em algum lugar entre quem foi de Metrô e quem foi de Ônibus, nessa ordem.
    aEsquerda(pessoa(_, _, _, _, _, metro), pessoa(_, _, _, _, _, bicicleta), S), aDireita(pessoa(_, _, _, _, _, onibus), pessoa(_, _, _, _, _, bicicleta), S),

    % A visitante que chegou mais cedo está ao lado da visitante de bolsa Vermelha.
    aoLado(pessoa(_, _, _, _, 900, _), pessoa(vermelha, _, _, _, _, _), S),

    % Iara está ao lado da mulher de bolsa Azul.
    aoLado(pessoa(_, iara, _, _, _, _), pessoa(azul, _, _, _, _, _), S),

    % A visitante que foi de Bicicleta está exatamente à esquerda da visitante de bolsa Verde.
    aoLado(pessoa(_, _, _, _, _, bicicleta), pessoa(verde, _, _, _, _, _), S), aEsquerda(pessoa(_, _, _, _, _, bicicleta), pessoa(verde, _, _, _, _, _), S),

    % A visitante que gosta do pintor Francês está ao lado de Sabrina.
    aoLado(pessoa(_, _, _, frances, _, _), pessoa(_, sabrina, _, _, _, _), S),

    % Quem gosta do pintor Espanhol está ao lado de quem chegou às 9:00.
    aoLado(pessoa(_, _, _, espanhol, _, _), pessoa(_, _, _, _, 900, _), S),

    % A dona da bolsa Vermelha gosta do pintor Italiano.
    member(pessoa(vermelha, _, _, italiano, _, _), S),

    % Quem chegou às 9:30 está entre quem foi de Trem e quem chegou às 9:00, nessa ordem.
    aDireita(pessoa(_, _, _, _, 900, _), pessoa(_, _, _, _, 930, _), S), aEsquerda(pessoa(_, _, _, _, _, trem), pessoa(_, _, _, _, 930, _), S),

    % A visitante de bolsa Branca está ao lado da visitante que foi de Metrô.
    aoLado(pessoa(branca, _, _, _, _, _), pessoa(_, _, _, _, _, metro), S),

    % testando bolsas
    bolsa(Bolsa1),
    bolsa(Bolsa2),
    bolsa(Bolsa3),
    bolsa(Bolsa4),
    bolsa(Bolsa5),
    todosDiferentes([Bolsa1, Bolsa2, Bolsa3, Bolsa4, Bolsa5]),

    % testando nomes
    nome(Nome1),
    nome(Nome2),
    nome(Nome3),
    nome(Nome4),
    nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),

    % testando idades
    idade(Idade1),
    idade(Idade2),
    idade(Idade3),
    idade(Idade4),
    idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    % testando pintor favorito
    pintor(Pintor1),
    pintor(Pintor2),
    pintor(Pintor3),
    pintor(Pintor4),
    pintor(Pintor5),
    todosDiferentes([Pintor1, Pintor2, Pintor3, Pintor4, Pintor5]),

    % testando hora chegada
    hora(Hora1),
    hora(Hora2),
    hora(Hora3),
    hora(Hora4),
    hora(Hora5),
    todosDiferentes([Hora1, Hora2, Hora3, Hora4, Hora5]),

    % testando meio de transporte
    transporte(Transporte1),
    transporte(Transporte2),
    transporte(Transporte3),
    transporte(Transporte4),
    transporte(Transporte5),
    todosDiferentes([Transporte1, Transporte2, Transporte3, Transporte4, Transporte5]).
