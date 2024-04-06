% Define the gender of the individuals
male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).

% Define the birth order
birth_order(prince_charles, 1).
birth_order(princess_ann, 2).
birth_order(prince_andrew, 3).
birth_order(prince_edward, 4).

% Define the old succession rule for males
succession_male(X, Order) :-
    male(X),
    birth_order(X, Order).

% Helper rule to find the next male in line that has not been considered yet
next_male_in_line(X, PrevOrder) :-
    succession_male(X, Order),
    Order > PrevOrder.

% Define the old succession rule for females
succession_female(X, Order) :-
    female(X),
    birth_order(X, Order).

% Helper rule to find the next female in line that has not been considered yet
next_female_in_line(X, PrevOrder) :-
    succession_female(X, Order),
    Order > PrevOrder.

% Define the old succession rule combining males and females
% This rule will find the next successor who is either the next male or, if all males are considered, the next female
old_succession(X) :- succession_male(X, _).
old_succession(X) :-
    \+ succession_male(_, _),
    succession_female(X, _).

% A rule to find the entire line of succession based on the old rules
% It uses recursion to find the next successor after the current one
find_succession_line(CurrentOrder, [NextInLine|RestOfLine]) :-
    next_male_in_line(NextInLine, CurrentOrder),
    !,  % Cut to commit to the first male found and prevent backtracking
    birth_order(NextInLine, NewOrder),
    find_succession_line(NewOrder, RestOfLine).
find_succession_line(CurrentOrder, [NextInLine|RestOfLine]) :-
    next_female_in_line(NextInLine, CurrentOrder),
    birth_order(NextInLine, NewOrder),
    find_succession_line(NewOrder, RestOfLine).
find_succession_line(_, []).

% A wrapper rule to start the line of succession
line_of_succession(LineOfSuccession) :-
    find_succession_line(0, LineOfSuccession).


