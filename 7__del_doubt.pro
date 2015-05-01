% Удаление всех дубликатов из списка.

domains
list=symbol*

predicates
nondeterm no_doobl(list,list)
nondeterm delrepete(list,list,list)
nondeterm append(list,list,list)
nondeterm member(symbol,list)

clauses
no_doobl(L,LF):- delrepete(L,[],LF).
delrepete([H|T],L,LF):- member(H,T),!, delrepete(T,L,LF).
delrepete([H|T],L,LF):- not(member(H,T)), append(L,[H],NewL), delrepete(T,NewL,LF).
delrepete([],L,L).

member(X,[X|_]).
member(X,[_|T]):-member(X,T).

append([],L,L).
append([H|T1],L2,[H|LF]):- append(T1,L2,LF).

GOAL
no_doobl([a,b,a,c,d,c,e],L).
