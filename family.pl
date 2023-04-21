male(javad).
male(hamid).
male(reza).
male(ali).
male(alireza).
female(zahra).
female(ziba).
female(maryam).
female(mina).
female(sara).

parent(javad, hamid).
parent(javad, maryam).
parent(zahra, hamid).
parent(zahra, maryam).
parent(ziba, mina).
parent(hamid, mina).
parent(maryam, ali).
parent(reza, ali).
parent(mina, sara).
parent(mina, alireza).
parent(ali, sara).
parent(ali, alireza).

mother(X, Y) :-
    female(X),
    parent(X, Y).

father(X, Y) :-
    male(X),
    parent(X, Y).

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

grandmother(X, Y) :-
    female(X),
    grandparent(X, Y).

grandfather(X, Y) :-
    male(X),
    grandparent(X, Y).

child(X, Y) :-
    parent(Y, X).

son(X, Y) :-
    male(X),
    child(X, Y).

daughter(X, Y) :-
    female(X),
    child(X, Y).

sibling(X, Y) :-
    child(X, Z),
    child(Y, Z).

brother(X, Y) :-
    male(X),
    sibling(X, Y).

sister(X, Y) :-
    female(X),
    sibling(X, Y).

uncle(X, Y) :-
    brother(X, Z),
    mother(Z, Y).

aunt(X, Y) :-
    sister(X, Z),
    father(Z, Y).

cousin(X, Y) :-
    (uncle(Z, X) ; aunt(Z, X)),
    child(Y, Z).
