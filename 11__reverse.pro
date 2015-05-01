% Реверс списка.

domains
list=integer*

predicates
reverse(list,list)
append (list,list,list)

clauses
reverse([],[]).
reverse([H|T], L):- reverse(T,X), append(X,[H],L).

append ([],L,L).
append ([H|T1], L2, [H|LF]):-append(T1,L2,LF).

GOAL
reverse([1,2,3,4],L).
