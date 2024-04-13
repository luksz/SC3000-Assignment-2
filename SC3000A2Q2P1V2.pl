% Define the gender of the individuals
male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).

% Define the birth order
birth_order(1, prince_charles).
birth_order(2, princess_ann).
birth_order(3, prince_andrew).
birth_order(4, prince_edward).

% Collect all male individuals in birth order
find_male_succession(MaleSuccession) :-
    findall(Order-Male, (birth_order(Order, Male), male(Male)), MalePairs),
    sort(MalePairs, SortedMalePairs),
    pairs_values(SortedMalePairs, MaleSuccession).

% Collect all female individuals in birth order
find_female_succession(FemaleSuccession) :-
    findall(Order-Female, (birth_order(Order, Female), female(Female)), FemalePairs),
    sort(FemalePairs, SortedFemalePairs),
    pairs_values(SortedFemalePairs, FemaleSuccession).

% Combine male and female succession lists
find_succession_line(SuccessionLine) :-
    find_male_succession(MaleSuccession),
    find_female_succession(FemaleSuccession),
    append(MaleSuccession, FemaleSuccession, SuccessionLine).

% A wrapper rule to start the line of succession
line_of_succession(LineOfSuccession) :-
    find_succession_line(LineOfSuccession).
