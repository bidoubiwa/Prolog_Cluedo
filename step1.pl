pair(X,Y,[X|_], [Y|_]).
pair(X,Y,[_|Tx], [_|Ty]) :-
    pair(X, Y, Tx, Ty).

multiPair(X, Y, [[Z, W]|_]) :-
    member(X, Z),
    member(Y, W).
multiPair(X, Y, [_|Tz]) :-
    multiPair(X, Y, Tz).

man(Man) :- member(Man, [marc, luc, jules, leon, loic, paul, jacques, jean, gerard, herve, pierrot]).

woman(Woman) :- member(Woman, [anne, lisa, sylvie, julie, valerie, eve, betty]).

husband_of(Man,Woman) :- 
    member((Man, Woman), [
        (marc, anne),
        (luc, betty),
        (jules, lisa),
        (leon, sylvie),
        (loic, eve),
        (paul, julie)
    ]), 
    man(Man), 
    woman(Woman).

wife_of(Woman, Man) :- husband_of(Man, Woman). 

child_of(Childs, Parents) :-
    multiPair(Childs, Parents, [ 
        [[jean, jules, leon], [marc, anne]],
        [[jacques],[jules, lisa]],
        [[lisa, loic, gerard],[luc, betty]],
        [[herve, julie], [leon, sylvie]],
        [[paul, valerie], [loic, eve]],
        [[pierrot], [paul, julie]]
        ]
        ).

father_in_law_of(FatherInLaw, Child) :-
    man(FatherInLaw),
    (husband_of(Child, X) ; wife_of(Child, X)),
    child_of(X, FatherInLaw).

mother_in_law_of(MotherInLaw, Child) :-
    woman(MotherInLaw),
    (husband_of(Child, X) ; wife_of(Child, X)),
    child_of(X, MotherInLaw).

ancestor_of(Ancestor, Child) :-
    child_of(Child, Ancestor).
ancestor_of(Ancestor, Child) :-
    child_of(Z, Ancestor),
    ancestor_of(Z, Child).
