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
laplacian_filter = [0 1 0; 1 -4 1; 0 1 0];   % Positive Laplacian fiter
output2 = imfilter(output1, laplacian_filter);

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

% Apply Sobel filters to calculate gradients in x and y directions
grad_x = imfilter(I, sobel_filter_x);
grad_y = imfilter(I, sobel_filter_y);

% Calculate the gradient magnitude
output4 = sqrt(grad_x.^2 + grad_y.^2);

subplot(2, 2, 4);
imshow(output4, []);
title('Figure (d) - Sobel filtered image');

% Step 5: Design a 5X5 average filter mask and apply it to image (d)
avg_filter_mask = ones([5 5]) / 25;
output5 = imfilter(output4, avg_filter_mask);

figure();
subplot(2, 2, 1);
imshow(output5);
title('Figure (e) - Average filtered image');

% Step 6: Get the product of (c) and (e)
output6 = output3 .* output5;
subplot(2, 2, 2);
imshow(output6);
title('Figure (f) - Product of (c) and (e).');

% Step 7: Add (a) and (f)
output7 = output1 + output6;

subplot(2, 2, 3);
imshow(output7);
title('Figure (g) - Add (a) and (f)');


% Step 8: Apply Power Law Transform
c = 1;
gamma_value = 0.5;
output8 = c* power(output7, gamma_value);

subplot(2, 2, 4);
imshow(output8);
title('Figure (h) - Power law transformed image');

