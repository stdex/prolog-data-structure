% Генерация всех подмножеств.

domains
list = integer*

predicates
nondeterm subset_all(list,list)

clauses
subset_all([],[]).
subset_all([H|T1],[H|T2]):-subset_all(T1,T2).
subset_all(L1,[_|T2]):- subset_all(L1,T2).

GOAL
subset_all(X,[2,9,2,5,1,7]).