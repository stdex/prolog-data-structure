% –азность множеств.

domains
list = integer*

predicates
nondeterm deduction(list,list)
nondeterm member(integer,list)
nondeterm del(integer,list,list)
nondeterm except(list,list,list)

clauses
/*принадлежность элемента к множеству*/
member(X,[X|_]).
member(X,[_|L]):- member(X,L).

/*удаление элемента из множества */
del(X,[X|L],L).
del(X,[Y|L],[Y|L1]):- del(X,L,L1).

/*удаление из второго множества, всех элементов первого множества*/
except([],L,L).
except([X|L1],L2,Result):- member(X,L2),!, del(X,L2,L), except(L1,L,Result); except(L1,L2,Result).

deduction(L1,L2):- except(L2,L1,Result), write(Result),nl.

GOAL
deduction([9,2,5,1,7],[5,7]).