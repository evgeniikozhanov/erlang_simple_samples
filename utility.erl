-module(utility).
-export([factorial/1]).
-export([reverse_list/1]).
-export([reverse_list/2]).
-export([convert_list_to_binary/1]).
-export([convert_list_to_binary/2]).
-export([starts_with/2]).
-export([starts_with_case/2]).
-export([starts_with_if/2]).
-export([standardize_measures_to_cm_old/1]).
-export([standardize_measures_to_cm/1]).
-export([total_cm/1]).

standardize_measures_to_cm(Measures) ->
	F = fun
				({cm, _} = Measure) -> Measure;
				({m, Value}) -> {cm, round(Value * 100)}
			end,
	lists:map(F, Measures).

standardize_measures_to_cm_old(Measures) ->
	standardize_measures_to_cm_old(Measures, []).

standardize_measures_to_cm_old([], Acc) -> lists:reverse(Acc);
standardize_measures_to_cm_old([{cm, _} = Measure | T], Acc) ->
	standardize_measures_to_cm_old(T, [Measure | Acc]);
standardize_measures_to_cm_old([{m, Value} | T], Acc) ->
	standardize_measures_to_cm_old(T, [{cm, round(Value * 100)} | Acc]).

total_cm(Measures) ->
	StandadizeMeasures = standardize_measures_to_cm_old(Measures),
	F = fun({cm, Value}, Acc) ->
		Acc + Value
			end,
	lists:foldl(F, 0, StandadizeMeasures).


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


starts_with([], _) -> true;
starts_with([H|TPortion], [H|TString]) ->
	starts_with(TPortion, TString);
starts_with(_, _) -> false.

starts_with_case(Portion, String) ->
	case string:left(String, length(Portion)) of
		Portion -> true;
		_ -> false
	end.

starts_with_if(Portion, String) ->
	Left = string:left(String, length(Portion)),
	if
		Left =:= Portion -> true;
		true -> false
	end.
