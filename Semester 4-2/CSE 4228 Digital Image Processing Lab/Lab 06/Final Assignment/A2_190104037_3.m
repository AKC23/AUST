%clc; clear all; close all;

% Step 1: Take the Input image and display
I = imread('Image1.jpg');
I = im2double(I);
output1 = I;

figure();
subplot(2, 2, 1);
imshow(output1);
title('Figure (a) - Input image');

% Step 2: Apply Laplacian Filter in image (a)
laplacian_filter = [0 1 0; 1 -4 1; 0 1 0];   % Positive Laplacian filter
output2 = zeros(size(output1));

[rows, cols] = size(output1);

for i = 2:rows-1
    for j = 2:cols-1
        output2(i, j) = sum(sum(output1(i-1:i+1, j-1:j+1) .* laplacian_filter));
    end
end

subplot(2, 2, 2);
imshow(output2, []);  % Adjusting the intensity range for better visualization
title('Figure (b) - Laplacian filtered image');

% Step 3: Get the Laplacian Enhanced Image (c)
output3 = output1 - output2;

subplot(2, 2, 3);
imshow(output3);
title('Figure (c) - Laplacian enhanced image');

% Step 4: Apply Sobel Filter on Image (a)
sobel_filter_x = [-1 0 1; -2 0 2; -1 0 1];  % Sobel filter for horizontal edges
sobel_filter_y = [-1 -2 -1; 0 0 0; 1 2 1];  % Sobel filter for vertical edges

grad_x = zeros(rows, cols);
grad_y = zeros(rows, cols);

for i = 2:rows-1
    for j = 2:cols-1
        grad_x(i, j) = sum(sum(output1(i-1:i+1, j-1:j+1) .* sobel_filter_x));
        grad_y(i, j) = sum(sum(output1(i-1:i+1, j-1:j+1) .* sobel_filter_y));
    end
end

output4 = sqrt(grad_x.^2 + grad_y.^2);

subplot(2, 2, 4);
imshow(output4, []);
title('Figure (d) - Sobel filtered image');

% Continue with the rest of the steps using similar loop-based approach...


