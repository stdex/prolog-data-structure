% Сумма арифметической прогрессии.

predicates
	sum(real, integer, real, real)
	
clauses
	sum(_, 0, _, 0) :- !.
	sum(A, N, D, S) :- B = A + D, K = N - 1, sum(B, K, D, T), S = A + T.
	
GOAL
	write("A1 = "), readreal(A1),
	write("N = "), readint(N), 
	write("D = "), readreal(D),
	sum(A1, N, D, S).