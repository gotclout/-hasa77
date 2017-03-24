compress(Xs, Z) :- length(Xs, XsL), Sz is mod(XsL, 2), N is div(XsL,2) + Sz,
                   Sz > 0 -> compressed(odd, Xs, N, Y, Z) ; compressed(even, Xs, N, Y, Z).

compressed(even, Xs, N, Y, Z) :- compressed(Xs, N, Y, Z).
compressed(odd, Xs, N, Y, Z) :- compressed(Xs, N, Y, Z).
compressed(L,0,[],L).
compressed([X|Xs],N,[X|Ys],Z) :-  N > 0, N1 is N - 1, compressed(Xs, N1, Ys, Z).
