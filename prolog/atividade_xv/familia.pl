genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).

genitor(liz,bill).

genitor(pat, jim).

mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).
homem(tom).
homem(bob).
homem(jim).
homem(bill).

pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

ascendente(X,Y) :- genitor(X,Y). %recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). %recursão - passo recursivo

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), mulher(AvohX).
irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

tio(X,Y) :- genitor(GenitorY, Y), irmaos(GenitorY, X), X \== Y, homem(X).
tia(X,Y) :- genitor(GenitorY, Y), irmaos(GenitorY, X), X \== Y, mulher(X).
primo(X,Y) :- genitor(GenitorY, Y), (tio(GenitorY, X); tia(GenitorY, X)), homem(X).
prima(X,Y) :- genitor(GenitorY, Y), (tio(GenitorY, X); tia(GenitorY, X)), mulher(X).
primos(X,Y) :- (primo(X, Y); prima(X, Y)).
bisavo(X,Y) :- (avo(AvoY, Y), pai(X, AvoY)); (avoh(AvohY, Y), pai(X, AvohY)).
bisavoh(X,Y) :- (avo(AvoY, Y), mae(X, AvoY)); (avoh(AvohY, Y), mae(X, AvohY)).

descendente(X, Y) :- genitor(Y, X).
descendente(X, Y) :- genitor(Y, GenitorY), descendente(X, GenitorY).

feliz(X) :- genitor(X, _).

meus_pais(X,Y,Z) :- genitor(X, Z), genitor(Y, Z), X \== Y.

% tio(bob, bill). -> true.
% tio(ana, jim). -> false.

% tia(bob, bill). -> false.
% tia(ana, jim). -> true.

% primo(bob, pam). -> false
% primo(bill, pat). -> true.
% primo(pat, bill). -> false.

% prima(bob, pam). -> false.
% prima(bill, pat). -> false.
% prima(pat, bill). -> true.

% bisavo(tom, jim). -> true.
% bisavo(bob, jim). -> false.

% bisavoh(pam, jim). -> true.
% bisavoh(pam, pat). -> false.

% descendente(bill, pam). -> false.
% descendente(ana, pam). -> true.

% feliz(bob). -> true.
% feliz(bill). -> false.

% meus_pais(pam, tom, bob). -> true.
% meus_pais(pam, tom, liz). -> false.