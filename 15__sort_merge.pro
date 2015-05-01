% Сортировка слиянием.

domains
list = integer*

predicates
nondeterm sort_merge(list,list)
nondeterm divide(list,list,list)
nondeterm merge(list,list,list)

clauses
sort_merge([],[]).
sort_merge([X],[X]).
sort_merge(L,LS):- divide(L,L1,L2), sort_merge(L1,L1S), sort_merge(L2,L2S), merge(L1S,L2S,LS),!.

divide([],[],[]).
divide([X],[X],[]).
divide([X,Y|T],[X|T1],[Y|T2]):- divide(T,T1,T2).

merge([X|T1], [Y|T2], [X|TS]):- X<Y, merge(T1,[Y|T2],TS).
merge([X|T1], [Y|T2], [X,X|TS]):- X=Y, merge(T1,T2,TS).
merge([X|T1], [Y|T2], [Y|TS]):- X>Y, merge([X|T1],T2,TS).
merge([],L,L).
merge(L,[],L).

GOAL
sort_merge([9,2,5,1,7],L).