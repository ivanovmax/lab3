-module(db).
-export([new/0, put/3, delete/2, get/2, find/2]).

new() -> [].

put(K, V, Db) -> 
	case get(K, Db) of
		{error, _} -> [{K,V}|Db];
		_Else -> {error, 'Key already exists'}
	end.

delete(K, Db) -> [{Xk , V} || {Xk , V} <- Db, Xk /= K ].

get(_, []) -> {error, 'Key not found'};
get(K, [{K,V}|_]) -> V;
get(K, [_|T]) -> get(K, T).

find(V, Db) -> [K || {K, Vx} <- Db, Vx =:= V].