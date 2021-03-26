test([], _, _, _).
test([Y|Ys], X, Cs, Ds) :-
    C is X-Y, \+ member(C, Cs),
    D is X+Y, \+ member(D, Ds),
    X1 is X + 1,
    test(Ys, X1, [C|Cs], [D|Ds]).

perm([], []).
perm(List, [H|Perm]) :- select(H, List, Rest), perm(Rest, Perm).

% Change perm's vector to alter n-queens
queenN(Q) :- perm(__permList__, Q), test(Q, 1, [], []), !.

allQueenN(A) :- findall(Q, queenN(Q), A).
countAllQueenN(C) :- allQueenN(A), length(A, C).


% Call for timing of all solutions
%statistics(runtime,[Start|_]),
%    countAllQueenN(C),
%    statistics(runtime,[Stop|_]),
%    Runtime is Stop - Start, write('Execution took '), write(Runtime), write(' ms. There are '), write(C), write(' solutions'), nl.

% Call for timing of first solution
%statistics(runtime,[Start|_]),
%    queenN(C),
%    statistics(runtime,[Stop|_]),
%    Runtime is Stop - Start, write('Execution took '), write(Runtime), write(' ms. There are '), write(C), write(' solutions'), nl.