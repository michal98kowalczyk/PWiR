-module(zad2).
-export([len/1]).

len([])->0;
len([_])->1;
len(L)->len(L,0).


len([_|T],Len)->len(T,Len+1);
len([],Len)->Len.

