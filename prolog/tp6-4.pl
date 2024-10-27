
% TP 6 - Ejercicio 4 


% 1. multirot(Xs,MRXs)

multirot(X, R) :-
  rotacion(X, R).
multirot(X, L) :-
  rotacion(X, R),
  append(R, Tail, L),
  multirot(X, Tail), !.

rotacion(List, Rotated) :-
  append(Front, Back, List),
  Back \= [],
  append(Back, Front, Rotated).


% 2. son_consecutivas(N,Xs)

son_consecutivas(1,[1]).
son_consecutivas(N,L) :-
  N1 is N-1,
  consecutivos(N,H),
  son_consecutivas(N1,T),
  append_front_or_back(H,T,L).

consecutivos(N, 0, []) :- !.
consecutivos(N, M, [N|T]) :- M > 0, M1 is M-1, consecutivos(N, M1, T).

append_front_or_back(H,T,L) :- append(H,T,L).
append_front_or_back(H,T,L) :- append(T,H,L).
