% Question 2 - Royal Family
% Authors: Luar Shui Yan (U2221566E) and Tan Yong Jie 

% Add imports
:- discontiguous offspring/2.

% Facts
offspring(queen_elizabeth, prince_charles).
offspring(queen_elizabeth, princess_ann).
offspring(queen_elizabeth, prince_andrew).
offspring(queen_elizabeth, prince_edward).

birth_order(prince_charles, 1).
birth_order(princess_ann, 2).
birth_order(prince_andrew, 3).
birth_order(prince_edward, 4).

is_male(prince_charles).
is_male(prince_andrew).
is_male(prince_edward).

is_female(princess_ann).

/*
% 2.1. Old succession rule
successor_old(X, Y) :- 
    offspring(X, Y), 
    is_male(Y), 
    birth_order(Y, YOrder), 
    \+ (offspring(X, Z), is_male(Z), birth_order(Z, ZOrder), ZOrder < YOrder).

% Call successor_old/2 predicate during initialization
:- initialization((trace, find_all_successors_old, notrace)).

find_all_successors_old :-
    findall(
        Order-Successor, 
        (offspring(queen_elizabeth, Successor), is_male(Successor), birth_order(Successor, Order)), 
        Successors),
    sort(Successors, Sorted),
    print_sorted_successors(Sorted).

print_sorted_successors([]).
print_sorted_successors([_-Successor | Rest]) :-
    write(Successor), nl,
    print_sorted_successors(Rest).
*/

% 2.2. New succession rule
successor_new(X, Y) :-
    offspring
    offspring(X, Y),
    birth_order(Y, YOrder), 
    \+ (offspring(X, Z), birth_order(Z, ZOrder), ZOrder < YOrder).

% Call successor_new/2 predicate during initialization
:- initialization((trace, find_all_successors_new, notrace)).

find_all_successors_new :-
    findall(
        Order-Successor, 
        (offspring(queen_elizabeth, Successor), birth_order(Successor, Order)), 
        Successors),
    sort(Successors, Sorted),
    print_sorted_successors(Sorted).

print_sorted_successors([]).
print_sorted_successors([_-Successor | Rest]) :-
    write(Successor), nl,
    print_sorted_successors(Rest).