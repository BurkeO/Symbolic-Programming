
s1 --> u(Zeros), [2], v(Zeros).

v(succ(succ(Zeros))) --> [1], v(Zeros).
v(Zeros) --> [0], v(Zeros).
v(0) --> [].


u(succ(Zeros)) --> [0], u(Zeros).
u(Zeros) --> [1], u(Zeros).
u(0) --> [].

%-----------------------------------------------------------------------------

s2 --> col(A), nat(B), pet(C), col(D), nat(E), pet(F), col(G), nat(H), pet(I), {A\=D, D\=G, A\=G, B\=E, E\=H, B\=H, C\=F, F\=I, C\=I}.

col([red]) --> [red].
col([blue]) --> [blue].
col([green]) --> [green].

nat([english]) --> [english].
nat([spanish]) --> [spanish].
nat([japanese]) --> [japanese].

pet([jaguar]) --> [jaguar].
pet([snail]) --> [snail]. 
pet([zebra]) --> [zebra]. 

%-------------------------------------------------------------------------------

mklist(N, L):- findall(Num, between(1, N, Num), L).


accRev([H|T],A,R):-  accRev(T,[H|A],R).
accRev([],A,A). 

rev(L,R):-  accRev(L,[],R). 

getRList(N,Rlist) :- mklist(N,L), rev(L,Rlist).

s3(Sum) --> [Sum].
s3(Sum) --> [X], {getRList(Sum,L), member(X,L), is(R,Sum-X), R\= 0}, s3(R).



%-------------------------------------------------------------------------------
