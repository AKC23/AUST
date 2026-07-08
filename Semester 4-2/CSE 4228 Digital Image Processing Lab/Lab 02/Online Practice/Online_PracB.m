clc;
close all;

img1 = imread('image3.png');
img2 = imread('image2.png');

[row, col, ~] = size(img1);

img = img2;

k = 1; % Start from the top
for i = row:-1:1  
    for j = i:(col - i - 1)
        img(j, k, 1) = img1(j, k, 1);
        img(j, k, 2) = img1(j, k, 2);
        img(j, k, 3) = img1(j, k, 3);
    end
    k = k + 1; % Increment the row index
end

imshow(img);
