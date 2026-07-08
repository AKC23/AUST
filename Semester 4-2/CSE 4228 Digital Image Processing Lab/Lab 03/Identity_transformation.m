clc;
close all;

input = imread('cameraman.png');

[row, col, ~] = size(input);
% X = uint8(zeros(row,col));
X = zeros(1,256);

for i=1:row
    for j=1:col
        temp = input(i,j) + 1;
        X(temp) = X(temp) + 1;
    end    
end

% disp(input);
subplot(2,2,1);
imshow(input);

subplot(2,2,2);
% figure;
bar(X);

