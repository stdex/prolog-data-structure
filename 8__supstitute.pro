% Замена в списке всех вхождений.

domains
list=symbol*

predicates
nondeterm supstitute(symbol,list,symbol,list)

clauses
supstitute(_,[],_,[]).
supstitute(X,[X|T],Y,[Y|TF]):-!, supstitute(X,T,Y,TF).
supstitute(X,[H|T],Y,[H|TF]):- supstitute(X,T,Y,TF). 

GOAL
supstitute(a,[a,b,a,c,d,c,e],k,X).
