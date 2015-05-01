% Сортировка пузырьком.

domains
list = integer*

predicates
nondeterm sort_buble(list,list)
nondeterm permit(list,list)

clauses
sort_buble(L,LS):- permit(L,TempL),!, sort_buble(TempL,LS).
sort_buble(L,L).

permit([X,Y|T],[Y,X|T]):- X>Y.
permit([H|T1],[H|T2]):-permit(T1,T2).

GOAL
sort_buble([9,2,5,1,7],L).