change(e,w).
change(w,e).

% [w, w, w, w] => nextConfig [e, e, w, w]
move([X,X,Goat,Cabbage],wolf,[Y,Y,Goat,Cabbage]) :-
     change(X,Y).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]) :-
     change(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]) :-
     change(X,Y).
move([X,Wolf,Goat,C],nothing,[Y,Wolf,Goat,C]) :-
     change(X,Y).

oneEq(X,X,_).
oneEq(X,_,X).

% In case we moved Wolf :safe([e, e, w, w])
% In case we moved Goat :safe([e, w, e, w])
safe([Man,Wolf,Goat,Cabbage]) :-
    % Wolf case : oneEq(e, w, e)
    % Goat case : oneEq(e, e, w)
     oneEq(Man,Goat,Wolf), % AT ANY TIME GOAT AND WOLF MUST BE SEPARATED
    % Wolf case : oneEq(e, w, w).
    % Goat case : oneEq(e, e, w).
     oneEq(Man,Goat,Cabbage).

solution([e,e,e,e], []).
% 1TIME => config = [w, w, w, w], [Move1, Move2, Move3, Move4, Move5, Move6, Move7]
solution(Config,[Move|Rest]) :-
    % config = [w, w, w, w] Move = Move1, NextConfig = ?
     move(Config,Move,NextConfig),
     % move = wolf , nextConfig = [e, e, w, w]
     safe(NextConfig),
     solution(NextConfig,Rest).


begin() :-
    member(Y, [1,2,3,4,5,6,7,8,9,10]),
    setof(
        X,
        (length(X, Y),
        solution([w, w, w, w], X)),
    X),
    write(X).