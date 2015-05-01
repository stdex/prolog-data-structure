% ��������� ��������� �������� �� mod N steep M

predicates
counter(integer,integer)
counter(integer,integer,integer)

clauses
/* M - ������ ��������.
 * S - ��� ��������.
 * N - ������� �������� ��������.
 */
counter(S,M):- counter(S,M,S).
counter(0,_,_):- write("0. "),!. /* ���������� ����������� = 0 */
counter(N,M,S):- write(N, ","), NewN=(N+S) mod M, counter(NewN,M,S). /* ������� �� ��������� ��������� */

goal
counter(11,18).