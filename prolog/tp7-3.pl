
% Ejercicio 3.1

equilatero(L,L,L).
isosceles(L,L,_) :- !.
isosceles(L,_,L) :- !.
isosceles(_,L,L) :- !.
escaleno(A,B,C) :- \+isosceles(A,B,C).

triangulo(A,B,C) :-
    (escaleno(A,B,C), write("escaleno"), nl; nl),
    (isosceles(A,B,C), write("isosceles"), nl; nl),
    (equilatero(A,B,C), write("equilatero"), nl; nl), !.


% Ejercicio 3.2

% hanoi(nDiscos, Inicio, Origen)
hanoi(1, S, F) :- write(S), write("->"), write(F), nl.
hanoi(N, S, F) :-
    N > 1, S >= 1, S =< 3, F >= 1, F =< 3,
    Aux is 6-S-F,
    N1 is N-1,
    hanoi(N1, S, Aux),
    hanoi(1, S, F),
    hanoi(N1, Aux, F).

%
% Ejercicio 3.3

ensenia("Dr. Nacho", history).
ensenia("Dr. Nacho", italiano).
ensenia("Dr. Nacho", drama).
ensenia("Dr. Gucci", fisica).
estudia(kirk, italiano).
estudia(olivia, drama).
estudia(lemmy, fisica).
estudia(angus, italiano).

