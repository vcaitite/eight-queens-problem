test([], _, _, _).
test([Y|Ys], X, Cs, Ds) :-
    C is X-Y, \+ member(C, Cs),
    D is X+Y, \+ member(D, Ds),
    X1 is X + 1,
    test(Ys, X1, [C|Cs], [D|Ds]).

perm([], []).
perm(List, [H|Perm]) :- select(H, List, Rest), perm(Rest, Perm).

% Change perm's vector to alter n-queens
queen8(Q) :- perm([1,2,3,4,5,6,7,8], Q), test(Q, 1, [], []), !.

allQueen8(A) :- findall(Q, queen8(Q), A).
countAllQueen8(C) :- allQueen8(A), length(A, C).


% Call for timing of all solutions
%statistics(runtime,[Start|_]),
%    countAllQueen8(C),
%    statistics(runtime,[Stop|_]),
%    Runtime is Stop - Start, write('Execution took '), write(Runtime), write(' ms. There are '), write(C), write(' solutions'), nl.

% Call for timing of first solution
%statistics(runtime,[Start|_]),
%    queen8(C),
%    statistics(runtime,[Stop|_]),
%    Runtime is Stop - Start, write('Execution took '), write(Runtime), write(' ms. There are '), write(C), write(' solutions'), nl.