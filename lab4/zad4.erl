-module(zad4).
-export([decreasing/1]).
-export([generate/1]).

decreasing(0)->[];
decreasing(N)->decreasing([],N).

decreasing(L,N) when N>0 ->decreasing(lists:append(L,[N]),N-1);
decreasing(L,0)->L.


generate(0)->[];
generate(N)->generate([],N).

generate(L,N) when N>0 -> generate(lists:append(L,[1]),N-1);
generate(L,0)->L.

