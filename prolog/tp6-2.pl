
% TP 6 - Ejercicio 2


% Casos a probar. Intentan unificar utilizando el signo igual.
% Si lo logra, quedan los valores de las variables en la lista
% declarada en la cabeza de cada regla, para después imprimirlos.

ej_a([['X',X], ['Y',Y], ['Z',Z]]) :-
  write('[a,b,c] = [X,Y,Z]?'),
  [a,b,c] = [X,Y,Z].

ej_b([['X',X], ['Y',Y]]) :-
  write('[a,b,c] = [X|Y]?'),
  [a,b,c] = [X|Y].

ej_c([['T',T]]) :-
  write('[a,b,c] = [b|T]?'),
  [a,b,c] = [b|T].

ej_d([['X',X], ['Y',Y], ['Z',Z]]) :-
  write('[a,b,c] = [X,Y|Z]?'),
  [a,b,c] = [X,Y|Z].

ej_e([['X',X], ['Y',Y], ['Z',Z], ['T',T]]) :-
  write('[a,b,c] = [X,Y,Z|T]?'),
  [a,b,c] = [X,Y,Z|T].

ej_f([]) :-
  write('[a,b,c] = [a|[b|[c|[]]]]?'),
  [a,b,c] = [a|[b|[c|[]]]].

ej_g([['X',X], ['Y',Y], ['Z',Z]]) :-
  write('[X,Y,Z] = [coding, is, fun]?'),
  [X,Y,Z] = [coding, is, fun].

ej_h([['X',X], ['Y',Y]]) :-
  write('[cat] = [X|Y]?'),
  [cat] = [X|Y].

ej_i([['X',X], ['Y',Y], ['Z',Z]]) :-
  write('[[the|Y]|Z] = [[X,here]|[is,here]]?'),
  [[the|Y]|Z] = [[X,here]|[is,here]].


% Punto de entrada. Prueba todos los casos y los imprime por pantalla.

main :- nl, write('Ejercicio 2'), nl, nl,
  List = [ej_a, ej_b, ej_c, ej_d, ej_e, ej_f, ej_g, ej_h, ej_i],
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
