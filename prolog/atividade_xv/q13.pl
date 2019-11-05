% questao 13

% ?- maior(10, 12, 11, X). -> X = 12.
% ?- maior(10, 3, 11, X). -> X = 11.
% ?- maior(15, 12, 11, X). -> X = 15.
% ?- maior(1805, 10002, 11765, X). -> X = 11765.

maior(A, B, C, X) :- (A > B, A > C) -> X is A; (B > C) -> X is B; X is C.