% Факториал с хвостовой рекурсией

predicates
factorial (integer, integer)
factorial (integer,integer,integer,integer)

clauses 
factorial (N, Fact):-factorial (N, Fact, 1, 1).
factorial (N, Fact, N, Fact):-!.
factorial (N, Fact, I, F):-
	NewI = I+1,
	NewF = F*NewI,
	factorial (N, Fact, NewI, NewF).
	
GOAL
factorial (5, Fact).