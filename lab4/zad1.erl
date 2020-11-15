-module(zad1).
-export([pole/1]).
-export([objetosc/1]).


pole({kwadrat,X,Y}) ->  X*Y;
pole({kolo,X}) -> 3.14*X*X;
pole({trojkat,A,H}) -> A*H/2;
pole({trapez,A,B,H}) -> (A+B)*H/2;
pole({szescian,A}) -> 6*A*A;
pole({kula,R}) -> 4*3.14*R*R;
pole({stozek,R,L}) -> 3.14*R*(R+L).

objetosc({szescian,A}) ->A*A*A;
objetosc({kula,R}) -> 3/4 * 3.14*R*R;
objetosc({stozek,R,H}) -> 1/3 * R*R*H.
