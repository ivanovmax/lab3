-module(db).
-export([new/0, put/3, delete/2, get/2, find/2]).

new() -> [].

put(K, V, Db) -> 
	case get(K, Db) of
		{error, _} -> [{K,V}|Db];
		_Else -> {error, 'Key already exists'}
	end.

delete(K, Db) -> lists:keydelete(K, 1, Db).

find(V, Db) -> lists:filter(fun({_,V1}) -> V=:=V1 end, Db).

get(K, L) ->
	case lists:keyfind(K,1,L) of
		{_, Value} -> Value;
		_ -> {error, 'Key not found'}
	end.