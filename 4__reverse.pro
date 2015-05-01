% Печаетает список в обратном порядке.

domains
list=symbol*

predicates
reverse(list,list)
append(list,list,list)

clauses
reverse([],[]).
reverse([H|T],L):- reverse(T,X), append(X,[H],L).

append([],L,L).
append([H|T1],L2,[H|Lf]):- append(T1,L2,Lf).

GOAL
reverse([a,b,c,d,e],X).

