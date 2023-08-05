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

%O = imrotate(I, 90);    %90 degrees clockwise
%O = imrotate(I, 180);    %180 degrees clockwise
O = imrotate(I, -270);    %270 degrees clockwise

subplot(2,2,2);
imshow(O);


