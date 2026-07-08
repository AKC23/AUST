clc;
close all;

input = imread('cameraman.png');
desired = imread('peppers_color.png');  % Replace 'desired_image.png' with the path to your desired image

L = 256;
input_hist = zeros(L, 1);
desired_hist = zeros(L, 1);

% 1.b Compute no. of pixels for input image
[rows, cols] = size(input);
totalPixels = rows * cols;

% 1.c Compute PDF for input image
for i = 1:rows
    for j = 1:cols
        intensity = input(i, j) + 1;
        input_hist(intensity) = input_hist(intensity) + 1;
    end
end

% 1.b Compute no. of pixels for desired image
[rows_desired, cols_desired] = size(desired);
totalPixels_desired = rows_desired * cols_desired;

% 1.c Compute PDF for desired image
for i = 1:rows_desired
    for j = 1:cols_desired
        intensity = desired(i, j) + 1;
        desired_hist(intensity) = desired_hist(intensity) + 1;
    end
end

% Compute CDF for input image
input_pdf = input_hist / totalPixels;
input_cdf = cumsum(input_pdf);

% Compute CDF for desired image
desired_pdf = desired_hist / totalPixels_desired;
desired_cdf = cumsum(desired_pdf);

% Perform Histogram Specification
output_image = zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        intensity = input(i, j) + 1;
        [~, index] = min(abs(input_cdf(intensity) - desired_cdf));
        output_image(i, j) = index - 1;
    end
end

% Display original and equalized images
subplot(2, 2, 1);
imshow(input);
title('Original Image');

subplot(2, 2, 2);
imshow(output_image, []);
title('Histogram Specified Image');

% Display histograms
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
