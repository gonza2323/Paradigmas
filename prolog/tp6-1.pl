
% TP 6 - Ejercicio 1


% Casos a probar. Intentan unificar utilizando el signo igual.
% Si lo logra, quedan los valores de las variables en la lista
% declarada en la cabeza de cada regla, para después imprimirlos.

ej_01([]) :-
  write('bing = bong?'),
  bing = bong.

ej_02([]) :-
  write('2 = 2?'),
  2 = 2.

ej_03([]) :-
  write('\'joe\' = joe?'),
  'joe' = joe.

ej_04([]) :-
  write('\'2\' = 2?'),
  '2' = 2.

ej_05([['X', X]]) :-
  write('joe = X?'),
  joe = X.

ej_06([['X', X], ['Y', Y]]) :-
  write('X = Y?'),
  X = Y.

ej_07([['J', J]]) :-
  write('J = joe, J = john?'),
  J = joe, J = john.

ej_08([]) :-
  write('pan = pan?'),
  pan = pan.

ej_09([]) :-
  write('\'Pan\' = pan?'),
  'Pan' = pan.

ej_10([]) :-
  write('\'pan\' = pan?'),
  'pan' = pan.

ej_11([['Pan', Pan]]) :-
  write('Pan = pan'),
  Pan = pan.

ej_12([]) :-
  write('pan = salsa?'),
  pan = salsa.

ej_13([]) :-
  write('comida(pan) = pan?'),
  comida(pan) = pan.

ej_14([['X', X]]) :-
  write('comida(pan) = X?'),
  comida(pan) = X.

ej_15([['X', X]]) :-
  write('likes(X, X), likes(joe, pizza)'),
  likes(X, X) = likes(joe, pizza).

ej_16([['X', X]]) :-
  write('father(X) = X?'),
  father(X) = X.

ej_17([['X', X]]) :-
  write('comida(X) = comida(pan)?'),
  comida(X) = comida(pan).

ej_18([['X', X], ['Y', Y]]) :-
  write('comida(pan, X) = comida(Y, salchicha)?'),
  comida(pan, X) = comida(Y, salchicha).

ej_19([['X', X]]) :-
  write('comida(X) = X?'),
  comida(X) = X.

ej_20([['X', X], ['Y', Y]]) :-
  write('comida_evento(comida(pan), bebida(cerveza)) = comida_evento(X, Y)?'),
  comida_evento(comida(pan), bebida(cerveza)) = comida_evento(X, Y).

ej_21([['X', X]]) :-
  write('comida_evento(comida(pan), X) = comida_evento(X, bebida(cerveza))?'),
  comida_evento(comida(pan), X) = comida_evento(X, bebida(cerveza)).

ej_22([['Whom', Whom], ['What', What]]) :-
  write('eats(fred, tomatoes) = eats(Whom, What)?'),
  eats(fred, tomatoes) = eats(Whom, What).

ej_23([['A', A], ['B', B]]) :-
  write('cd(29, beatles, sgt_pepper) = cd(A, B, help)?'),
  cd(29, beatles, sgt_pepper) = cd(A, B, help).

ej_24([['X', X]]) :-
  write('f(X, a) = f(a, X)?'),
  f(X, a) = f(a, X).

ej_25([['X', X]]) :-
  write('likes(jane, X) = likes(X, jim)?'),
  likes(jane, X) = likes(X, jim).

ej_26([['X', X], ['Y', Y], ['P', P]]) :-
  write('f(X, Y) = f(P, P)?'),
  f(X, Y) = f(P, P).

ej_27([['L', L], ['A1', A1], ['A2', A2]]) :-
  write('f(foo, L) = f(A1, A2)?'),
  f(foo, L) = f(A1, A2).


% Punto de entrada. Prueba todos los casos y los imprime por pantalla.

main :- nl, write('Ejercicio 1'), nl, nl,
  List = [ej_01, ej_02, ej_03, ej_04, ej_05, ej_06, ej_07, ej_08, ej_09, ej_10,
          ej_11, ej_12, ej_13, ej_14, ej_15, ej_16, ej_17, ej_18, ej_19, ej_20,
          ej_21, ej_22, ej_23, ej_24, ej_25, ej_26, ej_27],
  test_all(List).

test_all([]).
test_all([H | Tail]) :-
  test(H),
  test_all(Tail).


% Llamamos al predicado de cada ejercicio con un argumento que es la variable
% Vars, donde guardamos los resultados de la unificación si es que fue
% exitosa. En tal caso, imprimimos el unificador.

test(Predicate) :-
  call(Predicate, Vars), !,
  nl, write('yes'), write(', '),
  print_vars(Vars),
  nl, nl.

test(_) :-
  nl, write('no'), nl, nl.


% Funciones para imprimir variables

print_vars([]).
print_vars([H | Tail]) :-
  write('{ '),
  print_var(H),
  print_vars_aux(Tail),
  write(' }').

print_vars_aux([]).
print_vars_aux([H | Tail]) :-
  write(', '),
  print_var(H),
  print_vars_aux(Tail).

print_var([Var_Name, Var]) :- 
  acyclic_term(Var), !,
  write(Var_Name), write('/'), write(Var).
print_var([Var_Name, _]) :- 
  write(Var_Name), write(' is cyclic!').
