% Добавление элемента последним в список.

domains
L=integer*

predicates
add(integer, L, L)
add1(L,L)
append (L,L,L)

clauses
add1([],[]).
add1([H1|T1], [H2|T2]):- H2=H1, add1(T1,T2).

append ([],L,L).
append ([H|T1], L2, [H|LF]):-append(T1,L2,LF).

add(X,L,[X|L]).

GOAL
add1([1,2,3,4],L),
add(5,[],X),
append(L,X,LF).

