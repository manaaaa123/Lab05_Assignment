male(abraham).
female(mona).
male(herb).
male(homer).
female(marge).
male(clancy).
female(jackie).
female(patty).
female(selma).
male(bart).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).
parent(selma, ling).


father(X, Y) :-
    parent(X, Y),
    male(X).

mother(X, Y) :-
    parent(X, Y),
    female(X).

son(X, Y) :-
    parent(Y, X),
    male(X).

daughter(X, Y) :-
    parent(Y, X),
    female(X).

      
brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

grandfather(X, Y) :-
    parent(X, P),
    parent(P, Y),
    male(X).

aunt(X, Y) :-
    parent(P, Y),
    sister(X, P).

uncle(X, Y) :-
    parent(P, Y),
    brother(X, P).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2).


ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, P),
    ancestor(P, Y).



53 ?- father(abraham, herb).
true.

54 ?-  sister(marge, patty).
true .

55 ?-  daughter(marge, clancy).
true.

56 ?- ancestor(clancy, bart).
true .

57 ?- cousin(lisa, selma).
false.

58 ?- cousin(lisa, ling).
true 

59 ?- uncle(herb, lisa).
true .

60 ?- aunt(patty, bart).
true .

61 ?- son(herb, abraham).
true.

62 ?- mother(marge, maggie).
true.

63 ?- grandfather(clancy, bart).
true 











