% Генерация состояний счетчика по mod N steep M

predicates
counter(integer,integer)
counter(integer,integer,integer)

clauses
/* M - Модуль счетчика.
 * S - Шаг счетчика.
 * N - Текущее значение счетчика.
 */
counter(S,M):- counter(S,M,S).
counter(0,_,_):- write("0. "),!. /* Замыкающее соотношение = 0 */
counter(N,M,S):- write(N, ","), NewN=(N+S) mod M, counter(NewN,M,S). /* Функция по генерации состояний */

goal
counter(11,18).