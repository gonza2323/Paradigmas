
% TP 6 - Ejercicio 4 


% 1. multirot(Xs,MRXs)

multirot(X, R) :-
  rotacion(X, R).
multirot(X, L) :-
  rotacion(X, R),
  append(R, Tail, L),
  multirot(X, Tail).

rotacion(List, Rotated) :-
  append(Front, Back, List),
  Back \= [],
  append(Back, Front, Rotated).


% 2. son_consecutivas(N,Xs)

son_consecutivas(N, L) :-
    son_consecutivas_aux(N, L, []).

son_consecutivas_aux(0, [], _).
son_consecutivas_aux(N, [H|T], Vistos) :-
    N > 0, H =< N,
    \+ elem(H, Vistos),
    consecutivos(H, [H|T], T2),
    son_consecutivas_aux(N, T2, [H|Vistos]).

consecutivos(0, _, [], _).
consecutivos(N, X, [X|T]) :-
    N > 0,
    N1 is N - 1,
    consecutivos(N1, X, T).

elem(X, [X|_]) :- !.
elem(X, [_|T]) :- elem(X, T).

