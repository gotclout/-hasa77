use_module(library(clpfd)).

playout(A, L) :- dominos_arrangement(A, L, Vs), label(Vs).
playout(A) :- dominos_arrangement(A, As, Vs), label(Vs).
dominos_arrangement(Ds, Solution, Vs) :-
        same_length(Ds, As),
        dominos_tuples(Ds, Ts),
        phrase(dominos_ids(As, IDs), Vs),
        tuples_in(As, Ts),
        As = [First|Rest],
        foldl(linked_domino, Rest, First, _),
        all_distinct(IDs),
        maplist(domino_triple, Solution, As), !.

linked_domino([Val,Next,_], Prev, [_,Next,_]) :-
        Prev = [_,Val,_].

dominos_ids([], []) --> [].
dominos_ids([[X,Y,ID]|Ds], [ID|IDs]) -->
        [X,Y,ID],
        dominos_ids(Ds, IDs).

dominos_tuples(Ds, Ts) :-
        phrase(dominos_tuples_(Ds, 0), Ts).

dominos_tuples_([], _) --> [].
dominos_tuples_([d(X,Y)|Ds], ID0) -->
        [[X,Y,ID0],[Y,X,ID0]], { ID #=
                                 ID0 + 1},
        dominos_tuples_(Ds, ID).

domino_triple(d(X,Y), [X,Y,_]).
