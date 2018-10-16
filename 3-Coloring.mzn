% Simple 3-Coloring encoding

% define colors 1,2,3
set of int: Colors = 1..3;

% the 4 vertices, each with a possible value 1,2,3
var Colors: n1;
var Colors: n2;
var Colors: n3;
var Colors: n4;

% constraints regarding the edge relation
constraint n1 != n2;
constraint n1 != n3;
constraint n2 != n3;
constraint n2 != n4;

solve satisfy;
