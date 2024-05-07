% Question 1 - Smart Phone Rivalry
% Authors: Luar Shui Yan (U2221566E) and Tan Yong Jie 

% Add imports
:- discontiguous competitor/2..
:- discontiguous unethical/1..

% Facts
% sumsum and appy are smart phone tech companies
smart_phone_tech(sumsum).
smart_phone_tech(appy).

% sumsum is a competitor of appy
competitor(sumsum, appy).

% galacticas3 is developed by sumsum
developed(sumsum, galacticas3).

% galaticas3 is stolen by stevey
stolen(stevey, galacticas3).

% stevey is a boss of appy
boss(stevey, appy).

% Rules
% it is unethical for a boss to steal business from rival companies
unethical(X) :- boss(X, Y), stolen(X, Z), developed(W, Z), rival(W, Y).

% a competitor is a rival
rival(X, Y) :- competitor(X, Y), X \= Y.

% smart phone tech is business
business(X) :- smart_phone_tech(X).

% Call unethical/1 predicate during initialization
:- initialization((trace, unethical(stevey), notrace)).

