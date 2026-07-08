clear all;
close all;
clc;
% Read the input images
image1 = imread('img1.jpg');
image2 = imread('img2.jpg');

% Resize the input images to the same size
image1 = imresize(image1, [500, 500]);
image2 = imresize(image2, [500, 500]);

% Convert the resized images to grayscale
% grayImage1 = rgb2gray(image1);
% grayImage2 = rgb2gray(image2);

% Get the size of the resized images
[height, width, ~] = size(image1);

% Create a blank image with 6 columns
blankImage = uint8(zeros(height, 6 * width / 6, 3));

% Replace odd columns with portion from image1 and even columns with portion from image2
for col = 1 : 2 : 6
    blankImage(:, col * width / 6 - width / 6 + 1 : col * width / 6, :) = image1(:, (col - 1) * width / 6 + 1 : col * width / 6, :);
end

for col = 2 : 2 : 6
    blankImage(:, col * width / 6 - width / 6 + 1 : col * width / 6, :) = image2(:, (col - 1) * width / 6 + 1 : col * width / 6, :);
end

% Display the input images and the modified image in separate windows
figure;
subplot(1, 3, 1);
imshow(grayImage1);
title('Input Image 1');

subplot(1, 3, 2);
imshow(grayImage2);
title('Input Image 2');

grayImage3 = rgb2gray(blankImage);

%subplot(1, 3, 3);
figure;imshow(grayImage3);
title('Modified Image');

imwrite(grayImage3, 'Output.jpg');
