domains
bctt = tree(char, bctt, bctt); nil

predicates
nondeterm run(bctt)
nondeterm do(char, bctt, bctt)
create_tree(bctt, bctt)
write_tree(bctt)
insert(char, bctt, bctt)
height(bctt, integer)
max(integer, integer, integer)
nondeterm modif_tree(bctt, bctt)
nondeterm del_mem_tree(char, bctt, bctt)
nondeterm del_min(char, bctt, bctt)
nondeterm mem_tree(bctt, char)


clauses
run(Tree):-nl,nl,
write("****ENTER****\n"),
write("-1 to update TREE\n"),
write("-2 to show TREE\n"),
write("-3 to delete element of TREE\n"),
write("-4 to show height of TREE\n"),
write("-5 to check element of TREE\n"),
write("-0 to EXIT\n"),
write(">-"), readchar(C), write(C), nl,
do(C, Tree, NewTree), run(NewTree).

do('1', Tree, NewTree):- write("Enter character or ? to End\n\n"), create_tree(Tree, NewTree).
do('2', Tree, Tree):- nl, write_tree(Tree), nl, write(Tree).
do('3', Tree, NewTree):- modif_tree(Tree,NewTree).
do('4', Tree, Tree):- nl, height(Tree,H), write(H).
do('5', Tree, Tree):- readchar(E), mem_tree(Tree, E), write("yes"); write("no").
do('0',_,nil):- write("\n this all."), exit.

/* создание дерева */
/* вводим и печатаем значение */
/* если введен символ ? выйти из рекурсии и сформировать окончательное дерево */
create_tree(Tree, NewTree):-readchar(C), C<>'?',!,
write(C, "_"),
/* вставляем значение во времянное дерево */
insert(C,Tree,TempTree), create_tree(TempTree, NewTree).
create_tree(Tree,Tree).

/* вставляем значение в пустое дерево, получаем дерево с корневой вершиной */
insert(New, nil, tree(New,nil,nil)):-!.
/* если элемент меньше корня вставляем в левое дерево */
insert(New, tree(E,Left,Right), tree(E,NewLeft,Right)):- New<E,!, insert(New, Left, NewLeft).
/* если элемент больше корня вставляем в правое дерево */
insert(New, tree(E,Left,Right), tree(E,Left,NewRight)):- insert(New, Right, NewRight).

/* печать дерева */
write_tree(nil).
write_tree(tree(E,Left,Right)):- write_tree(Left), write(E, " "), write_tree(Right).

/* Высота дерева - это наибольшая длина пути от корня дерева до его листа. */
/* Первый аргумент - дерево; второй - высота дерева */
height(nil,0). /* Высота пустого дерева равна нулю */
/* HL - высота левого поддерева */
/* HR - высота правого поддерева */
/* MH - максимум из высот левого и правого поддеревьев */
/* H - высота дерева, с учетом уровня, на котором находится корень дерева */
height(tree(_, Left, Right), H):- height(Left,HL),  height(Right,HR), max(HL,HR,MH), H=MH+1.
max(X,Y,X):- X>=Y,!. /* если первое число больше второго, то первое число - максимум */ 
max(_,Y,Y). /* в противном случае максимумом будет второе число */

/* удаление элемента из дерева */
/* считывание элемента для удаления, вывод получившегося дерева */
modif_tree(T,NT):-readchar(C), nl, write(C), del_mem_tree(C,T,TempT), nl, write(TempT), modif_tree(TempT,NT).
modif_tree(T,T).

/* X совпадает с корневым значением исходного дерева, правое поддерево пусто */
del_mem_tree(X,tree(X, Left, nil), Left).
/* X совпадает с корневым значением исходного дерева, левое поддерево пустое */
del_mem_tree(X,tree(X, nil, Right), Right).

/* X меньше корневого значения дерева */
del_mem_tree(X,tree(E,Left,Right),tree(E,NewLeft,Right)):-E>X,del_mem_tree(X,Left,NewLeft).
/* X больше корневого значения дерева */
del_mem_tree(X,tree(E,Left,Right),tree(E,Left,NewRight)):-X>E,del_mem_tree(X,Right,NewRight).
/* X совпадает с корневым значением исходного дерева */
del_mem_tree(X,tree(X, Left, Right), tree(E,Left, NewRight)):- del_min(E,Right,NewRight).

/* Если левое поддерево пусто, то минимальный элемент - корень,
а дерево без минимального элемента - это правое поддерево.*/
del_min(X,tree(X,nil,Right),Right).
/* Левое поддерево не пусто, значит, оно содержит минимальное значениевсего дерева, которое нужно удалить */
del_min(X,tree(E,Left,Right),tree(E,NewLeft,Right)):- del_min(X,Left,NewLeft).

/* Первый аргумент - дерево, в котором мы ищем данное значение; второй - исходное значение */
/* Некоторое значение принадлежит данному дереву , если оно либо содержится
 * в корне дерева, либо принадлежит левому поддереву, либо принадлежит правому поддереву. 
 * Других вариантов нет.
 */
mem_tree(tree(E,_,_),E):-!. /* E - является корнем дерева */
mem_tree(tree(_,Left,_),E):- mem_tree(Left,E). /* E принадлежит левому поддереву */
mem_tree(tree(_,_,Right),E):-mem_tree(Right,E). /* E принадлежит правому поддереву */

GOAL
run(nil).