% questao 9

% ?- xor_(true,false). -> true .
% ?- xor_(true,true). -> false.
% ?- xor_(false,true). -> true.
% ?- xor_(false,false). -> false.

xor_(A, B) :- (A, not(B));(not(A), B).