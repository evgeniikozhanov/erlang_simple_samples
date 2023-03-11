-module(utility).
-export([factorial/1]).
-export([reverse_list/1]).
-export([reverse_list/2]).
-export([convert_list_to_binary/1]).
-export([convert_list_to_binary/2]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).

reverse_list(List) ->
	reverse_list(List, []).

reverse_list([], ReversedAcc) -> ReversedAcc;
reverse_list([H|T], ReversedAcc) ->
	reverse_list(T, [H|ReversedAcc]).

convert_list_to_binary(List) ->
	convert_list_to_binary(List, <<>>).

convert_list_to_binary([], Acc) -> Acc;
convert_list_to_binary([H|T], Acc) ->
	convert_list_to_binary(T, <<Acc/binary, H>>).
