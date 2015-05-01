% ѕровер€ет €вл€етс€ ли список - подсписком.

domains
list = integer*

predicates
nondeterm subset(list,list)
nondeterm member(integer,list)

clauses
subset([],_).
subset([H1|T1],L2):- member(H1,L2),
subset(T1,L2).

member(X,[X|_]).
member(X,[_|T]):- member(X,T).

GOAL
subset([5,2],[9,2,5,1,7]).