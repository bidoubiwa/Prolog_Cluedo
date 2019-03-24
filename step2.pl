adjacent(A, B, List) :- nextto(A, B, List); nextto(B, A, List).

solve(Fish_owner) :-

    % house(color, nationality, pet, drink, smoke)
    length(Houses, 5),

    % 1 - The Englishman lives in the red house.
    member(house(red, english, _, _, _), Houses),

    % 2 - The Swede has dogs.
    member(house(_, swede, dog, _, _), Houses),

    % 3 - The Dane drinks tea.
    member(house(_, dane, _, tea, _), Houses),

    % 4 - The green house is to the left of the white house.
    nextto(house(white, _, _, _, _), house(green, _, _, _, _), Houses),

    % 5 - The owner of the green house drinks coffee.
    member(house(green, _, _, coffee, _), Houses),

    % 6 - The person who smokes Pall Mall has birds.
    member(house(_, _, bird, _, pall_mall), Houses),

    % 7 - The owner of the yellow house smokes Dunhill.
    member(house(yellow, _, _, _, dunhill), Houses),

    % 8 - The person living in the center house drinks milk.
    nth1(3, Houses, house(_, _, _, milk, _)),

    % 9 - The Norwegian lives in the first house.
    nth1(1, Houses, house(_, norwegian, _, _, _)),

    % 10 - The man who smokes Blend lives next to the one who has cats.
    adjacent(house(_, _, _, _, blend), house(_, _, cat, _, _), Houses),

    % 11 - The man who has a horse is the neighbor of the one who smokes Dunhill.
    adjacent(house(_, _, horse, _, _), house(_, _, _, _, dunhill), Houses),

    % 12 - The owner who smokes Blue Master drinks beer.
    member(house(_, _, _, beer, blue_master), Houses),

    % 13 - The German smokes of the prince.
    member(house(_, german, _, _, prince), Houses),

    % 14 - The Norwegian lives right next to the blue house.
    adjacent(house(_, norwegian, _, _, _), house(blue, _, _, _, _), Houses),

    % 15 - The man who smokes Blend has a neighbor who drinks water.
    adjacent(house(_, _, _, _, blend), house(_, _, _, water, _), Houses),

    % solution
    member(house(_, Fish_owner, fish, _, _), Houses).