
calc([],0):- !.
calc(L,V):- L = [_|T], calc(T,V1), V is V1 + 3.

go:- calc([1,3,6,9,10],S), write(S).



%go:- calcH(1,0,H), write('Heuristics: '),write(H).
% calcH(9,X,X):-!.
% calcH(T,X,Y):- check(T,V), X1 is X+V, T1 is T+1, calcH(T1,X1,Y).
% check(T,V):-tp(T,A,B), gtp(T,C,D), A=C, B=D, V is 0,!
% check(_,1):-!.
