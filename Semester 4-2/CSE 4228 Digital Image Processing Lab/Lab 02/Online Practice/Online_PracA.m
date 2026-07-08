clc;
close all;

img1 = imread('image1.png');
img2 = imread('image2.png');

[row, col, ~] = size(img1);

img = img2;

k = 1; % Start from the top
for i = 1:row
    for j = i:(col - i - 1)
        img(k, j, 1) = img1(k, j, 1);
        img(k, j, 2) = img1(k, j, 2);
        img(k, j, 3) = img1(k, j, 3);
    end
    k = k + 1; % Increment the row index
end

imshow(img);
