clc;
close all;

I = imread('oppenheimer.jpg');
%I = rgb2gray(I);
disp(size(I));

I = imresize(I,[500,500]);
[row,col,~] = size(I);

disp(row);
disp(col);
subplot(2,2,1);
imshow(I);

O = uint8(zeros(row,col));

for i = 1:row
    for j = 1:col
        %O(i, col-j+1) = I(i, j);   % Horizontal mirror
        O(row-i+1, j) = I(i, j);   % veritcal mirror
    end
end

subplot(2,2,2);
imshow(O);
