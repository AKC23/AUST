clc;
close all;
clear all;

I = imread('cameraman.png');

%I = rgb2gray(I);

[row, col, ~] = size(I);

figure();
subplot(2,2,1);
imshow(I);
title('Original Image');

%a = input('Enter Average filter size: ');
a = 5;
filter = ones(a) / (a * a); % Create the averaging filter of size a x a
[p, q] = size(filter);

% Pad the input image to handle the border pixels
paddedImage = padarray(double(I), [(p-1)/2 (q-1)/2]);

% Applying the average filter
outputImage = zeros(row, col);
for i = 1:row
    for j = 1:col
        window = paddedImage(i:i+p-1, j:j+q-1);
        outputImage(i, j) = sum(sum(window .* filter));
    end
end

% Convert output image to uint8 and display
outputImage = uint8(outputImage);

subplot(2,2,2);
imshow(outputImage);
title('Original Image');


