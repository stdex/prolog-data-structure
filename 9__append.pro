% Слияние списков.

domains
list=symbol*

predicates
nondeterm append(list,list,list)

clauses
append([],L,L).
append([H|T1],L2,[H|LF]):- append(T1,L2,LF).

GOAL
append([a,b,с],[d,e],LF).
