
% TP 6 - Ejercicio 3


% 1. primero(L,X)
primero([X|_], X).


% 2. resto(L1,L2)
resto([_|T1], T1).


% 3. construye(X,L1,L2)
construye(X, L1, [X|L1]).


% 4. pertenece(X,L)
pertenece(X,[X|_]).
pertenece(X,[_|Tail]) :- pertenece(X,Tail).


% 5. concatena(L1,L2,L3)
concatena([], L2, L2).
concatena([H1|T1], L2, [H1|L3]) :-
  concatena(T1,L2,L3).


% 6. palíndromo(L)
palindromo(L) :-
  reverse(L, ReverseL),
  L = ReverseL.


% 7. último(X,L)
ultimo_append(X,L) :-
  append(_, [X], L).

ultimo_reverse(X, L) :-
  reverse(L, [X | _]).

ultimo_recursivo(X, [X]).
ultimo_recursivo(X, [_|T]) :-
  ultimo_recursivo(X, T).

ultimo(X, L) :- ultimo_recursivo(X, L).


% 8. inserta(X,L1,L2)
inserta(X,L1,L2) :-
  select(X,L2,L1).


% 9. sublista(L1,L2)
sublista(L1,L2) :-
  append(L1,_,L2), !.
sublista(L1,[_|T2]) :-
  sublista(L1,T2).


% 10. subconjunto(L1,L2)
subconjunto(_,[]).
subconjunto(L1, [H2|T2]) :-
  pertenece(H2, L1),
  subconjunto(L1, T2).


% 11. maximo(X,Y,Z)
maximo(X,Y,X) :- X > Y, !.
maximo(X,Y,Y) :- Y >= X, !.


% 12. mcd(X,Y,Z)
mcd(X,0,X) :- !.
mcd(X,Y,Z) :-
  R is X mod Y,
  mcd(Y, R, Z).


% 13. longitud(L,N)
longitud([], 0).
longitud([_|T], N) :-
  N1 is N - 1,
  longitud(T, N1).


% 14. lista_acotada(L)
lista_acotada(L) :-
  length(L, Lenght),
  lista_acotada(L, Lenght).

lista_acotada([],_).
lista_acotada([H|T],Lenght) :-
  H < Lenght,
  lista_acotada(T, Lenght).


% 15. max_lista(L,X)
max_lista([X], X).
max_lista([H|T],X) :-
  max_lista(T, M),
  M > H,
  X is M, !.
max_lista([H|T],X) :-
  max_lista(T, M),
  M =< H,
  X is H, !.


% 16. suma_lista(L,X)
suma_lista([], 0).
suma_lista([H|T], X) :-
  suma_lista(T, S),
  X is H + S.


% 17. ordenada(L)
ordenada([]).
ordenada([_]) :- !.
ordenada([X,Y|T]) :- X =< Y, ordenada([Y|T]).


% 18. lista(N,L)
lista(N, L) :-
  length(L, N),
  lista_aux(L, N).

lista_aux([],_).
lista_aux([N|T],N) :- lista_aux(T,N).


% 19. lista_de_numeros(N,M,L)
lista_de_numeros(X,X,[X]) :- !.
lista_de_numeros(N,M,[N|L]) :-
  N < M,
  N1 is N + 1,
  lista_de_numeros(N1,M,L), !.
lista_de_numeros(N,M,[N|L]) :-
  N > M,
  N1 is N - 1,
  lista_de_numeros(N1,M,L), !.


% 20. entre(N1,N2,X)
entre(N1,N2,X) :- N1 =< X, X =< N2.
