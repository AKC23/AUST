clc;
%% Same task is done without loop + if
A = floor(rand(5,5)*10);
B = ones(5,5)*9;
C = A + B;
[row, col] = size(C);
disp(row);
disp(col);
I = eye(row, col);
disp(I);
D = C.*I;
disp(D);