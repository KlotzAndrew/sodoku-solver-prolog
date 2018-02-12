:- use_module(library(clpfd)).

sudoku(Rows) :-
    append(Rows, Vs), Vs ins 1..9,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [A,B,C,D,E,F,G,H,I],
    blocks(A, B, C), blocks(D, E, F), blocks(G, H, I).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
        all_distinct([A,B,C,D,E,F,G,H,I]),
        blocks(Bs1, Bs2, Bs3).

% Rows = [
%   [_,_,7, _,_,3, _,5,_],
%   [_,3,_, 9,7,_, 4,_,8],
%   [8,9,_, 1,_,2, _,3,_],
%
%   [_,_,_, 7,_,_, 9,_,_],
%   [_,_,5, _,3,_, 8,_,6],
%   [_,_,8, _,_,_, 3,_,1],
%
%   [_,7,9, _,_,4, 1,_,_],
%   [4,8,1, _,9,_, _,_,2],
%   [6,_,_, _,8,_, _,_,_]
% ],
% Rows = [A,B,C,D,E,F,G,H,I],
% sudoku(Rows).
