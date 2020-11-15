-module(zad3).
-export([amin/1]).
-export([amax/1]).
-export([tmin_max/1]).
-export([lmin_max/1]).

amin([])->null;
amin([H|T])->amin(T,H).    % H is min value in first "iteration" 

amin([H|T],Min) when H < Min -> amin(T,H);
amin([_|T],Min)->amin(T,Min);
amin([],Min)->Min.



amax([])->null;
amax([H|T])->amax(T,H).    % H is max value in first "iteration" 

amax([H|T],Max) when H > Max -> amax(T,H);
amax([_|T],Max)->amax(T,Max);
amax([],Max)->Max.

tmin_max([])->null;
tmin_max(L) -> {amin(L),amax(L)}.

lmin_max([])->null;
lmin_max(L) -> [amin(L),amax(L)].
