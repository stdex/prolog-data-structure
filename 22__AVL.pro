domains
c=char
i=integer
avl=avl(bt,i)
bt=bt(avl,c,avl); nil

predicates
nondeterm run(avl)
nondeterm do(c, avl, avl)
nondeterm createA(avl, avl)
nondeterm insertA(c, avl, avl)
nondeterm unionA(avl,c,avl,c,avl,avl)
max(i,i,i)

clauses
run(AVL):-nl,nl,
write("****ENTER****\n"),
write("-1 to update AVL TREE\n"),
write("-2 to show height of AVL TREE\n"),
write("-0 to EXIT\n"),
write(">-"), readchar(C), write(C), nl,
do(C, AVL, NewAVL), run(NewAVL).

do('1', AVL, NewAVL):- write("Enter character or ? to End\n\n"), createA(AVL, NewAVL).
do('2', AVL, AVL):- heightA(AVL, H), nl, write(" H=",H).
do('0',_,_):- write("\n this all."), exit.

/* —оздание дерева */
createA(AVL, NewAVL):-readchar(C), C<>'?',!,
write(C),nl,
insertA(C,AVL,avl(T,H)), nl, write(T), nl, write("H=", H), nl, createA(avl(T,H), NewAVL).

/* «амыкающее соотношение */
createA(AVL,AVL).

/* «апись в пустое дерево? New - корень нового_дерева */
insertA(New, avl(nil,0), avl(bt(avl(nil,0), New, avl(nil,0)),1)):-!.
/* ¬ставл€емый элемент E уже есть в корне дерева: тогда дерево оставл€ем прежним */
insertA(E, avl(bt(Left,E,Right),H), avl(bt(Left,E,Right),H)).

/* «апись в левое дерево; NewA - новое дерево */
insertA(New, avl(bt(Left,E,Right),_), NewA):-New < E, insertA(New,Left,avl(bt(LT,X,RT),_)), unionA(LT,X,RT,E,Right,NewA).

/* «апись в правое дерево; NewA - новое дерево */
insertA(New, avl(bt(Left,E,Right),_),NewA):- New>E, insertA(New, Right, avl(bt(LT,X,RT),_)), unionA(Left,E,LT,X,RT,NewA).


/* 3 правила преобразовани€ деревьев */

/* 1. ≈сли среднее дерево выше других, C - корень нового дерева, HC - высота нового дерева */
unionA(avl(T1,H1), A, avl(bt(L2,C,R2),H2), B, avl(T3,H3), avl(bt(avl(bt(avl(T1,H1),A,L2),HA), C, avl(bt(R2,B,avl(T3,H3)),HB)),HC)):-
H2>H1, H2>H3, HA=H1+1, HB=H3+1, HC=HA+1.

/* 2. ≈сли левое дерево выше других, A - корень нового дерева, HA - высота нового дерева */
unionA(avl(T1,H1), A, avl(T2,H2), B, avl(T3,H3), avl(bt(avl(T1,H1),A,avl(bt(avl(T2,H2),B,avl(T3,H3)),HB)),HA)):-
H1>=H2, H1>=H3, max(H2,H3, HB), max(H1,HB, HA).

/* 3. ≈сли правое дерево выше других, B - корень нового дерева, HB - высота нового дерева */
unionA(avl(T1,H1),A, avl(T2,H2),B,avl(T3,H3), avl(bt(avl(bt(avl(T1,H1),A,avl(T2,H2)),HA), B, avl(T3,H3)), HB)):-
H3>=H2, H3>=H1, max(H1,H2, HA), max(HA,H3, HB).

/* Ќахождение максимального из двух значений */
/* ¬ысота нового дерева будет на 1 больше высоты максимального из двух деревьев */
max(X,Y,Z):- X>Y,!, Z=X+1.
max(X,Y,Z):- X<=Y,!, Z=Y+1.


GOAL
run(avl(nil,0)).