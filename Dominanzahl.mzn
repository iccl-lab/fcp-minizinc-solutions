% CSP: Place a *minimal* number of queens on a chessboard,
% such that each unoccupied cell is under attack.
% (this is NOT the n-Queens problem)

int: n = 8;

% we play on a n x n board
% quen[i,j] = 1 means, there is a queen placed on row i, column j
array[1..n,1..n] of var 0..1: queen;

% attack[i,j] = 1 means, that cell (i,j) is attacked by some queen
array[1..n,1..n] of var 0..1: attack;

% this constraint does the job
% 1. on each cell [i,j], it is either attacked, or there is a queen
% 2. if it is attacked, then there is at least 1 queen in the same row, or
%    there is at least 1 queen in the same column, or
%    there is at least 1 queen in the diagonals
constraint forall(i,j in 1..n) (
  
   if attack[i,j]=1 then
     0 < sum(jj in 1..n)(queen[i,jj]) \/
     0 < sum(ii in 1..n)(queen[ii,j]) \/
     % diagonals
     0 < sum(jj,ii in 1..n where abs(ii-i) = abs(j-jj))(queen[ii,jj])
   else queen[i,j]=1
   endif

);

% compute the number of queens on the entire board
var int: queens = sum(i,j in 1..n)(queen[i,j]);

% solve and minimize with respect to "queens"
solve minimize queens;

% print the board (this is a bit static an does not adapt to n != 8)
% fix it!
output 
[show(queen[1,j]) | j in 1..n] ++ ["\n"] ++ 
[show(queen[2,j]) | j in 1..n] ++ ["\n"] ++ 
[show(queen[3,j]) | j in 1..n] ++ ["\n"] ++ 
[show(queen[4,j]) | j in 1..n] ++ ["\n"] ++ 
[show(queen[5,j]) | j in 1..n] ++ ["\n"] ++ 
[show(queen[6,j]) | j in 1..n] ++ ["\n"] ++ 
[show(queen[7,j]) | j in 1..n] ++ ["\n"] ++ 
[show(queen[8,j]) | j in 1..n];