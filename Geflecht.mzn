% 7 variables (as array of lenght 7) for the node values
array[1..7] of var 1..7: nodes;
% 7 variables (as array of lenght 7) for the respective neighbor sums
% of each node
array[1..7] of var int: sums;

% this is actually no needed :)
%include "alldifferent.mzn";
%constraint alldifferent(nodes);

% define the neighbor sum, i.e. sum[1] represents the sum of the neighbors
% of node 1, and so on ...
constraint sums[1] = nodes[2] + nodes[3] + nodes[4] + nodes[7];
constraint sums[2] = nodes[1] + nodes[3] + nodes[4];
constraint sums[3] = nodes[1] + nodes[2] + nodes[4] + nodes[5];
constraint sums[4] = nodes[1] + nodes[2] + nodes[3] + nodes[5] + nodes[7];
constraint sums[5] = nodes[3] + nodes[4] + nodes[6] + nodes[7];
constraint sums[6] = nodes[5];
constraint sums[7] = nodes[1] + nodes[4] + nodes[5];

% incorporate the constraints on the neighbors
% e.g. if value of node1 = 3 then then its neighbors must sum up to 14 ...
% instead of writing 49 if then statements explicitely we loop over the 7 nodes
constraint forall(i in 1..7)(
    if nodes[i] = 1 then
      sums[i] = 20
    elseif nodes[i] = 2 then
      sums[i] = 18
    elseif nodes[i] = 3 then
      sums[i] = 14
    elseif nodes[i] = 4 then
      sums[i] = 19
    elseif nodes[i] = 5 then
      sums[i] = 2
    elseif nodes[i] = 6 then
      sums[i] = 7
    elseif nodes[i] = 7 then
      sums[i] = 8
    else false endif
);

solve satisfy;