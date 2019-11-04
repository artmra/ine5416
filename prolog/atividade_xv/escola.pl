materia(ine5405).
materia(ine5412).
materia(ine5413).
materia(ine5415).
materia(ine5416).
materia(ine5414).
materia(ine5417).

professor(fletes).
professor(marcio).
professor(rafael).
professor(jerusa).
professor(maicon).
professor(carlos).
professor(ricardo).

aluno(arthur).
aluno(bryan).
aluno(eduardo).
aluno(isac).
aluno(daniela).
aluno(maria).

leciona(fletes,  ine5405).
leciona(marcio,  ine5412).
leciona(marcio,  ine5409).
leciona(rafael,  ine5413).
leciona(jerusa,  ine5415).
leciona(jerusa,  ine5418).
leciona(maicon,  ine5402).
leciona(maicon,  ine5416).
leciona(carlos,  ine5414).
leciona(ricardo, ine5417).

frequenta(arthur, ine5405).
frequenta(arthur, ine5412).
frequenta(arthur, ine5413).
frequenta(arthur, ine5415).
frequenta(arthur, ine5416).

frequenta(bryan, ine5405).
frequenta(bryan, ine5412).
frequenta(bryan, ine5413).
frequenta(bryan, ine5415).
frequenta(bryan, ine5416).

frequenta(eduardo, ine5405).
frequenta(eduardo, ine5413).
frequenta(eduardo, ine5415).
frequenta(eduardo, ine5416).

frequenta(isac, ine5405).
frequenta(isac, ine5415).
frequenta(isac, ine5409).
frequenta(isac, ine5414).
frequenta(isac, ine5417).

frequenta(daniela, ine5413).
frequenta(daniela, ine5417).

frequenta(maria, ine5415).
frequenta(maria, ine5414).

amigo(arthur, eduardo).
amigo(arthur, bryan).
amigo(arthur, maria).

amigo(eduardo, bryan).
amigo(eduardo, daniela).

amigo(bryan, isac).

amigo(maria, isac).

% X leciona uma disciplina na qual Y estah escrito
% eh_meu_professor(marcio, arthur). -> true.
% eh_meu_professor(carlos, arthur). -> true.
eh_meu_professor(X, Y) :- leciona(X, Z), frequenta(Y, W), Z == W, professor(X).

% X e Y sao amigos
% amigos(arthur, eduardo). -> true.
% amigos(arthur, isac). -> false.
amigos(X, Y) :- amigo(X, Y); amigo(Y, X).

% X eh colega de Y
% eh_meu_colega(arthur, maria). -> false.
% eh_meu_colega(arthur, eduardo). -> true.
eh_meu_colega(X, Y) :- frequenta(X, Z), frequenta(Y, W), Z == W, X \== Y.

% todas as disciplinas de marcio:
%		leciona(marcio, X).
%		ao final, quando aparecer o resultado, apertar r para executar e obter outros resultados

% todas os amigos de arthur:
%		amigo(arthur, X).
%		ao final, quando aparecer o resultado, apertar r para executar e obter outros resultados

% todas os alunos de marcio:
%		eh_meu_professor(marcio, X).
%		ao final, quando aparecer o resultado, apertar r para executar e obter outros resultados

% retorna se duas pessoas estao conectadas por alguma amizade em comum:
% mesmo_ciclo(arthur, isac). -> true.
mesmo_ciclo(X, Y) :- amigos(X, Y). % caso base
mesmo_ciclo(X, Y) :- amigos(X, Z), mesmo_ciclo(Z, Y), X\== Z. % recursão