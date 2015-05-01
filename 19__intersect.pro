% Пересечение множеств.

domains
list = integer*

predicates
nondeterm intersect(list,list,list)
nondeterm member(integer,list)

clauses
intersect([],_,[]).
intersect([H|T1],L2,[H|Ti]):- member(H,L2),!, intersect(T1,L2,Ti).
intersect([_|T1],L2,Li):- intersect(T1,L2,Li).

member(X,[X|_]).
member(X,[_|T]):- member(X,T).

GOAL
intersect([9,8],[9,2,5,1,7], X).