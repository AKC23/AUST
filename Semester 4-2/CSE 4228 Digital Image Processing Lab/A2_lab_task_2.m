clc; clear all; close all;

image = imread('coins.jpg'); 

gray_image = rgb2gray(image);

sobel_mask_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_mask_y = [-1 -2 -1; 0 0 0; 1 2 1];

derivative_x = conv2(double(gray_image), sobel_mask_x, 'same');
derivative_y = conv2(double(gray_image), sobel_mask_y, 'same');

gradient_magnitude = sqrt(derivative_x.^2 + derivative_y.^2);

threshold = 255; 

edge_image = gradient_magnitude > threshold;

subplot(1, 2, 1);
imshow(gray_image);
title('Original Image');

subplot(1, 2, 2);
imshow(edge_image);
title('Sobel Edge Detection');
