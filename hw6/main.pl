% [10] Write my_reverse which does the obvious.

my_reverse(L, RL) :- my_reverse(L, [], RL).

my_reverse([], RL, RL).
my_reverse([H|T], U, RL) :- my_reverse(T, [H|U], RL).

% [10] Write my_length which relates the list to its length.

my_length([],0).
my_length([H|T],N) :- my_length(T,N1), N is N1+1.

% [10] Write my_subset that takes a relation and a list. The last parameter is those in the list that satisfy the relation. You will need operator =.. for my_subset (read this). It is an equal followed by two dots.

my_subset(R, [], U):- U=[].
my_subset(R, [H|T], U):- 
F=..[R,H],(call(F),U=[H|U1],my_subset(R,T,U1);
    my_subset(R,T,U)).
	
%[10] Write my_member which relates an element to a list that the list is in.
my_member(X, [Y|T]) :- X = Y; my_member(X, T).

%[10] Write my_intersect that relates a list to another list. The third list is the subset of elements that are in both the first two lists.
my_intersect([], _, []).
my_intersect([H|L1tail], L2, L3) :- my_member(H, L2), !, L3 = [H|L3tail], my_intersect(L1tail, L2, L3tail).
my_intersect([_|L1tail], L2, L3) :- my_intersect(L1tail, L2, L3).

%[20] Define the predicate compute_change(Money, Quarter, Dime, Nickle, Penny). 
compute_change(Money,Quarter,Dime,Nickel,Penny) :-   
            member(Quarter,[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]), 
            member(Dime,[0,1,2]) ,      
            member(Nickel,[0,1]), 
			member(Penny, [0,1,2,3,4]),
			Money is  Penny+ 5*Nickel +10*Dime + 25*Quarter.
			
%[15] Define the predicate compose(L1, L2, L3) such that L3 consists of the element of L1 and L2 interleaved in order until one of them becomes nil, and then append that non-nil list at the end.
compose([],[],[]). 
compose([],L2,L2).
compose(L1,[],L1).
compose([H1|T1],[H2|T2],[H1, H2|T3]) :-
    compose(T1,T2,T3).
