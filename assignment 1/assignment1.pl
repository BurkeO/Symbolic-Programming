f0(null).
f1(null).

pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

%--------------------------------------------------------------------------Problem 1...

incr(f1(null), f0(f1(null))).
incr(f0(X), f1(X)).
incr(f1(X), f0(Y)) :- incr(X,Y).

%--------------------------------------------------------------------------Problem 2...

legal(f0(null)).
legal(X):-legal(Z),incr(Z,X).

incrR(X,Y):-legal(X),incr(X,Y).

%--------------------------------------------------------------------------Problem 3...

add(f0(null),Y,Y).
add(X,Y,Z):-incr(A,X), add(A,Y,B), incr(B,Z).

%--------------------------------------------------------------------------Problem 4...

mult(f0(null), pterm(), f0(null)).
mult(pterm(), f0(null), f0(null)).
mult(f1(null),X,X).
mult(X,f1(null),X).
mult(X,Y,Z):-incr(A,X), mult(A,Y,B), add(B,Y,Z).


%--------------------------------------------------------------------------Problem 5...

revers(null,null).
revers(f0(X),Y):-wrapf0(null,Z),revers_help(X,Z,Y).
revers(f1(X),Y):-wrapf1(null,Z),revers_help(X,Z,Y).

revers_help(null,Z,Y):-Z=Y.
revers_help(f0(X),Z,Y):-wrapf0(Z,A),revers_help(X,A,Y).
revers_help(f1(X),Z,Y):-wrapf1(Z,A),revers_help(X,A,Y).

wrapf1(X,f1(X)).
wrapf0(X,f0(X)).

%-------------------------------------------------------------------------Problem 6...

normalize(null,f0(null)).
normalize(f0(null),f0(null)).
normalize(X,Y):-revers(X,A),normalize_help(A,Z),revers(Z,Y).

normalize_help(f1(X),Y):-Y=f1(X).
normalize_help(f0(X),Y):-normalize_help(X,Y).

%--------------------------------------------------------------------------------------


% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),add(T1,T2,SumT), pterm2numb(SumT,Sum).

% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).

% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).

% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).

% make a pterm T from a number N    numb2term(+N,?T)
numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).

% make a number N from a pterm T  pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.

% reversible  ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).










































