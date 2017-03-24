% 1.17 (*): Split a list into two parts

% split(L,N,L1,L2) :- the list L1 contains the first N elements
%    of the list L, the list L2 contains the remaining elements.
%    (list,integer,list,list) (?,+,?,?)

split(Xs, N, Z) :- split(Xs, N, Z, _).
compress(Xs, Z) :- length(Xs, XsL), Sz is mod(XsL, 2), N is div(XsL,2) + Sz, Sz > 0 -> split(Xs, N, Z, _), write('compressed(odd,'), write(Z), write(')') ; split(Xs, N, Z, _), write('compressed(even'), write(Z), write(')').
compress( L,0,[],L).
compressed(odd, Z).
compressed(even, Z).
split(L,0,[],L).
split([X|Xs],N,[X|Ys],Zs) :- N > 0, N1 is N - 1, split(Xs,N1,Ys,Zs).

