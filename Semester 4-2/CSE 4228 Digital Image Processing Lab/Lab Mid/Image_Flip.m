clc;
close all;

I = imread('oppenheimer.jpg');
%I = rgb2gray(I);
disp(size(I));

I = imresize(I,[500,500]);

[row,col, ~] = size(I);

disp(row);
disp(col);

subplot(2,2,1);
imshow(I);

O = uint8(zeros(row,col));

for i = 1:row
    for j = 1:col
        % O(col - j + 1, i) = I(i,j);    %90 degree anticlockwise
        O(row-i+1, col-j+1) = I(i,j);   %180 degree 
        % O(j, row - i + 1) = I(i,j);    %270 degree
    end
end

subplot(2,2,2);
imshow(O);


