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

hora(9).
hora(9.5).
hora(10).
hora(10.5).
hora(11).

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
% ['/home/evaristo-mosby/Desktop/trabalho2.pl'].

solucao(S) :-
    S = [
        pessoa(bolsa1, nome1, idade1, pintor1, hora1, transporte1),
        pessoa(bolsa2, nome2, idade2, pintor2, hora2, transporte2),
        pessoa(bolsa3, nome3, idade3, pintor3, hora3, transporte3),
        pessoa(bolsa4, nome4, idade4, pintor4, hora4, transporte4),
        pessoa(bolsa5, nome5, idade5, pintor5, hora5, transporte5)
    ],

    % Sabrina está em algum lugar entre a dona da bolsa Amarela e a visitante que gosta do pintor Francês, nessa ordem.
    aEsquerda(pessoa(amarela, _, _, _, _, _), pessoa(_, sabrina, _, _, _, _), S), aDireita(pessoa(_, sabrina, _, _, _, _), pessoa(_, _, _, frances, _, _), S),

    % % Na primeira posição está quem foi de Trem.
    % transporte1 is trem,

    % % A visitante mais velha está em algum lugar à direita da visitante da bolsa Azul
    % aDireita(pessoa(_, _, 56, _, _, _), pessoa(azul, _, _, _, _, _), S),

    % % A mulher que chegou às 10:00 está ao lado da visitante que gosta do pintor Brasileiro.
    % aoLado(pessoa(_, _, _, _, 10.5, _), pessoa(_, _, _, brasileiro, _, _), S),

    % % A visitante de 28 anos está em algum lugar entre a dona da bolsa Branca e a mulher mais nova, nessa ordem.
    % aEsquerda(pessoa(branca, _, _, _, _, _), pessoa(_, _, 28, _, _, _), S), aDireita(pessoa(_, _, 28, _, _, _), pessoa(_, _, 20, _, _, _), S),

    % % A dona da bolsa Azul está em algum lugar à esquerda de quem chegou às 10:30.
    % aEsquerda(pessoa(azul, _, _, _, _, _), pessoa(_, _, _, _, 10.5, _), S),

    % % Quem foi de Metrô está ao lado de quem gosta do pintor Brasileiro.
    % aoLado(pessoa(_, _, _, _, _, metro), pessoa(_, _, _, brasileiro, _, _), S),

    % % Adriana está ao lado de quem foi de Bicicleta.
    % aoLado(pessoa(_, adriana, _, _, _, _), pessoa(_, _, _, _, _, bicicleta), S),

    % % Cecília está em uma das pontas.
    % noCanto(pessoa(_, cecilia, _, _, _, _), S),

    % % A visitante que gosta do pintor Brasileiro está em algum lugar entre a mulher de 45 anos e a mulher que gosta do pintor Italiano, nessa ordem.
    % aEsquerda(pessoa(_, _, 45, _, _, _), pessoa(_, _, _, brasileiro, _, _), S), aDireita(pessoa(_, _, _, brasileiro, _, _), pessoa(_, _, _, italiano, _, _), S),

    % % A mulher de 33 anos está ao lado da mulher que foi de Ônibus para a exposição.
    % aoLado(pessoa(_, _, 33, _, _, _), pessoa(_, _, _, _, _, onibus), S),

    % % A visitante da bolsa Verde gosta do pintor Francês.
    % menber(pessoa(verde, _, _, frances, _, _), S),

    % % Quem foi de Carro está ao lado de quem chegou às 10:00.
    % aoLado(pessoa(_, _, _, _, _, carro), pessoa(_, _, _, _, 10, _), S),

    % % Poliana está em algum lugar à direita da mulher de bolsa Azul.
    % aDireita(pessoa(_, poliana, _, _, _, _), pessoa(azul, _, _, _, _, _), S),

    % % Quem foi de Bicicleta está em algum lugar entre quem foi de Metrô e quem foi de Ônibus, nessa ordem.
    % aEsquerda(pessoa(_, _, _, _, _, metro), pessoa(_, _, _, _, _, bicicleta), S), aDireita(pessoa(_, _, _, _, _, bicicleta), pessoa(_, _, _, _, _, onibus), S),

    % % A visitante que chegou mais cedo está ao lado da visitante de bolsa Vermelha.
    % aoLado(pessoa(_, _, _, _, 9, _), pessoa(vermelha, _, _, _, _, _), S),

    % % Iara está ao lado da mulher de bolsa Azul.
    % aoLado(pessoa(_, iara, _, _, _, _), pessoa(azul, _, _, _, _, _), S),

    % % A visitante que foi de Bicicleta está exatamente à esquerda da visitante de bolsa Verde.
    % aoLado(pessoa(_, _, _, _, _, bicicleta), pessoa(verde, _, _, _, _, _), S), aEsquerda(pessoa(_, _, _, _, _, bicicleta), pessoa(verde, _, _, _, _, _), S),

    % % A visitante que gosta do pintor Francês está ao lado de Sabrina.
    % aoLado(pessoa(_, _, _, frances, _, _), pessoa(_, sabrina, _, _, _, _), S),

    % % Quem gosta do pintor Espanhol está ao lado de quem chegou às 9:00.
    % aoLado(pessoa(_, _, _, espanhol, _, _), pessoa(_, _, _, _, 9, _), S),

    % % A dona da bolsa Vermelha gosta do pintor Italiano.
    % menber(pessoa(vermelha, _, _, italiano, _, _), S),

    % % Quem chegou às 9:30 está entre quem foi de Trem e quem chegou às 9:00, nessa ordem.
    % aEsquerda(pessoa(_, _, _, _, _, trem), pessoa(_, _, _, _, 9.5, _), S), aDireita(pessoa(_, _, _, _, 9.5, _), pessoa(_, _, _, _, 9, _), S),

    % % A visitante de bolsa Branca está ao lado da visitante que foi de Metrô.
    % aoLado(pessoa(branca, _, _, _, _, _), pessoa(_, _, _, _, _, metro), S),

    % testando bolsas
    bolsa(bolsa1),
    bolsa(bolsa2),
    bolsa(bolsa3),
    bolsa(bolsa4),
    bolsa(bolsa5),
    todosDiferentes([bolsa1, bolsa2, bolsa3, bolsa4, bolsa5]),

    % testando nomes
    nome(nome1),
    nome(nome2),
    nome(nome3),
    nome(nome4),
    nome(nome5),
    todosDiferentes([nome1, nome2, nome3, nome4, nome5]),

    % testando idades
    idade(idade1),
    idade(idade2),
    idade(idade3),
    idade(idade4),
    idade(idade5),
    todosDiferentes([idade1, idade2, idade3, idade4, idade5]),

    % testando pintor favorito
    pintor(pintor1),
    pintor(pintor2),
    pintor(pintor3),
    pintor(pintor4),
    pintor(pintor5),
    todosDiferentes([pintor1, pintor2, pintor3, pintor4, pintor5]),

    % testando hora chegada
    hora(hora1),
    hora(hora2),
    hora(hora3),
    hora(hora4),
    hora(hora5),
    todosDiferentes([hora1, hora2, hora3, hora4, hora5]),

    % testando meio de transporte
    transporte(transporte1),
    transporte(transporte2),
    transporte(transporte3),
    transporte(transporte4),
    transporte(transporte5),
    todosDiferentes([transporte1, transporte2, transporte3, transporte4, transporte5]).
