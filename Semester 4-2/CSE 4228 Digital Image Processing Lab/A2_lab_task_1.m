clc; clear all; close all;

image = imread('lines.png');

if size(image, 3) == 3
    image = rgb2gray(image);
end

vertical_mask = [-1 0 1; -2 0 2; -1 0 1];
horizontal_mask = [-1 -2 -1; 0 0 0; 1 2 1];

horizontal_edges = conv2(double(image), horizontal_mask, 'same');
vertical_edges = conv2(double(image), vertical_mask, 'same');

subplot(1, 2, 1);
imshow(uint8(horizontal_edges));
title('Horizontal Lines Detection');

subplot(1, 2, 2);
imshow(uint8(vertical_edges));
title('Vertical Lines Detection');
