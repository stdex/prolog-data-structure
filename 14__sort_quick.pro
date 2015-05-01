% Быстрая сортировка.

domains
list = integer*

predicates
nondeterm sort_quick(list,list)
nondeterm partition(integer,list,list,list)
nondeterm append(list,list,list)

clauses
sort_quick([],[]).
sort_quick([H|T],LS):- 
partition(H,T,Llitl,Lbig),
sort_quick(Llitl,Lls),
sort_quick(Lbig,Lbs),
append(Lls, [H|Lbs], LS).

partition(_,[],[],[]).
partition(X,[Y|T],[Y|LL],Lb):- X>Y,!, partition(X,T,LL,Lb).
partition(X,[Y|T],LL,[Y|Lb]):- partition(X,T,LL,Lb).

append ([],L,L). 
append ([H|T1], L2, [H|LF]):-append(T1,L2,LF).

GOAL
sort_quick([9,2,5,1,7],L).