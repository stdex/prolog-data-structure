% Сортировка вставкой.

domains
list = integer*

predicates
nondeterm sort_in(list,list)
nondeterm insert(integer,list,list)

clauses
sort_in([],[]).
sort_in([H|T],LS):- sort_in(T,TempL), insert(H,TempL,LS).

insert(X,[Y|T1],[Y|T2]):-X>Y, !, insert(X,T1,T2).
insert(X,L,[X|L]).

GOAL
sort_in([9,2,5,1,7],L).