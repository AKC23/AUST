clc;
close all;

input = imread('cameraman.png');
desired = imread('image1.png');  % Replace 'desired_image.png' with the path to your desired image

L = 256;
input_hist = zeros(L, 1);
desired_hist = zeros(L, 1);

% Compute the number of pixels for the input image
[rows, cols] = size(input);
totalPixels = rows * cols;

% Compute the number of pixels for the desired image
[rows_desired, cols_desired] = size(desired);
totalPixels_desired = rows_desired * cols_desired;

% Compute PDF for the input image
for i = 1:rows
    for j = 1:cols
        intensity = input(i, j) + 1;  
        input_hist(intensity) = input_hist(intensity) + 1;  
    end
end
pdf_input = input_hist / totalPixels;

% Compute PDF for the desired image
for i = 1:rows_desired
    for j = 1:cols_desired
        intensity = desired(i, j) + 1;  
        desired_hist(intensity) = desired_hist(intensity) + 1;  
    end
end
pdf_desired = desired_hist / totalPixels_desired;

% Compute CDF for the input image
input_cdf = cumsum(pdf_input);

% Compute CDF for the desired image
desired_cdf = cumsum(pdf_desired);

% Perform histogram specification
input_cdf_normalized_rounded = round(input_cdf * (L - 1));

% Map the input image to the desired histogram
equalized_img = input_cdf_normalized_rounded(input + 1);
mapped_img = histeq(equalized_img, desired_cdf);

% Display images and histograms
subplot(2, 2, 1);
imshow(input);
title('Original Image');

subplot(2, 2, 2);
imshow(mapped_img, []);
title('Histogram Specified Image');

subplot(2, 2, 3);
bar(input_hist);
xlabel('Gray Level Intensity');
ylabel('Number of Pixels');
title('Original Histogram');

subplot(2, 2, 4);
bar(desired_hist);
xlabel('Gray Level Intensity');
ylabel('Number of Pixels');
title('Desired Histogram');
