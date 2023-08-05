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
O = flip(I, 2); % Horizontal mirror

subplot(2,2,2);
imshow(O);

O = flip(I, 1); % Vertical mirror

subplot(2,2,3);
imshow(O);



