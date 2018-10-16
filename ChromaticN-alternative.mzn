% Chromatic Number CSP
% Yet another encoding, just to play around with an bollean adjacent matrix :) 

int: nVertices  = 10;
int: nColors    = 10;

% definition of ranges
set of int: Vertice  = 1..nVertices;
set of int: Color    = 1..nColors;

% 2 dim. array (adjacent matrix) to encode the graph ( edge[i,j] = edge from vertice i to j ).
array[Vertice,Vertice] of bool: edges;
array[Vertice] of var Color: vertices;

% adjacent matrix
edges = [| false, true, false, false, false, true, false, false, false, false,
        | true, false, true, false, false, false, true, false, false, false,
        | false, true, false, true, false, false, false, true, false, false,
        | false, false, true,  false, true, false, false, false, true, false,
        | true, false, false, true, false, false, false, false, false, true,
        | true, false, false, false, false, false, false, true, true, false,
        | false, true, false, false, false, false, false, false, true, true,
        | false, false, true, false, false, true, false, false, false, true,
        | false, false, false, true, false, true, true, false, false, false,
        | false, false, false, false, true, false, true, true, false, false |];

% for every two vertices, if they are connected their value must be different
constraint forall ([vertices[i] != vertices[j] | i,j in Vertice where edges[i,j]=true] );

var Color: chrN = max(vertices);

solve minimize chrN;

output ["chromatic number: ", show(chrN)];
