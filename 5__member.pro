% Проверяет является ли символ элементом списка.

domains
list = symbol*

predicates
nondeterm member(symbol,list)

clauses
member(X,[X|_]).
member(X,[_|T]):-member(X,T).

GOAL
member(b,[aa,b,cc]).