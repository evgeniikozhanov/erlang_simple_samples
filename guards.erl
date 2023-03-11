-module(guards).
-export([demo/1]).
-export([is_domestic/1]).
-define(DOMESTIC_ANIMALS, [cat, dog, guinea_pig, horse, donkey, ferret]).

demo(X) when is_integer(X) orelse is_float(X) andalso X < 5 ->
	small_number;
demo(X) when is_integer(X); is_float(X) ->
	bigger_number;
demo(X) when is_list(X), length(X) < 5 ->
	short_list;
demo(X) when is_list(X) ->
	list.

is_domestic(Animal) ->
	lists:member(Animal, ?DOMESTIC_ANIMALS).

%is_domestic(Animal) ->
%	lists:member(Animal, [cat, dog, guinea_pig, horse, donkey, ferret]).

%is_domestic(Animal) when
%	Animal =:= cat;
%	Animal =:= dog;
%	Animal =:= guinea_pig;
%	Animal =:= horse;
%	Animal =:= donkey;
%	Animal =:= rat
%	->
%	true.
% is_domestic(_) -> false.
