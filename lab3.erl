-module(lab3).
-export([reduce/3, filter/2, filter1/2]).

reduce(_, Start, []) -> Start;
reduce(F, Start, [H|T]) -> reduce(F, F(Start, H), T). 

filter1(_, []) -> []; 
filter1(P, [H|T]) -> 
	case P(H) of
		true -> [H|filter1(P, T)];
		false -> filter1(P, T)
	end.

filter(P, L) -> [X || X <- L, P(X)].