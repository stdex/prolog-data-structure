% Объединение множеств.

domains
list = integer*

predicates
nondeterm unionset(list,list,list)
nondeterm member(integer,list)

clauses
unionset([],L,L).
unionset([H|T1],L2,L1):- member(H,L2),!, unionset(T1,L2,L1).
unionset([H|T1],L2,[H|T1]):- unionset(T1,L2,L1).

member(X,[X|_]).
member(X,[_|T]):- member(X,T).

GOAL
unionset([1,3], [9,2,5,1,7], X).