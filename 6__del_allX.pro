% Удаляет из списка все вхождения элемента.

domains
list = integer*

predicates
nondeterm delete(integer, list, list)

clauses
delete(_,[],[]).
delete(X,[X|L],L1):- delete(X,L,L1).
delete(X,[Y|L],[Y|L1]):-X<>Y,delete(X,L,L1).

GOAL
delete(1,[1,2,3,1,3],L).
