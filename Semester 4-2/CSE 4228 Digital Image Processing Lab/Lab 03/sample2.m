clc;
close all;

% Histogram Equalization
input = imread('cameraman.png');

L = 256;
input_hist = zeros(L, 1);

disp(L);

% Compute no. of pixels
[rows, cols] = size(input);
totalPixels = rows * cols;  
disp(totalPixels);

% Compute (PDF)
for i = 1:rows
    for j = 1:cols
        intensity = input(i, j) + 1;  
        input_hist(intensity) = input_hist(intensity) + 1;  
    end
end

input_pdf = input_hist / totalPixels;

% Compute (CDF)
input_cdf = zeros(L, 1);
input_cdf(1) = input_pdf(1);  

for i = 2:L
    input_cdf(i) = input_cdf(i-1) + input_pdf(i);  
end

input_cdf_normalized = input_cdf * (L - 1);

% Round the value of CDF
input_cdf_normalized_rounded = round(input_cdf_normalized);

% Display original image and equalized image
figure;
subplot(2, 2, 1);
imshow(input);
title('Original Image');

equalized_img = input_cdf_normalized_rounded(input + 1);
subplot(2, 2, 2);
imshow(equalized_img, []);
title('Equalized Image');

% Display original histogram
subplot(2, 2, 3);
bar(input_hist);
xlabel('Gray Level Intensity');
ylabel('Number of Pixels');
title('Original Histogram');

% Compute equalized histogram
equalized_hist = zeros(L, 1);
for i = 1:L
    equalized_hist(i) = sum(sum(equalized_img == i-1));
end

% Display equalized histogram
subplot(2, 2, 4);
bar(equalized_hist);
xlabel('Gray Level Intensity');
ylabel('Number of Pixels');
title('Equalized Histogram');

% Histogram Specification
input2 = imread('peppers_color.png');
input2_hist = zeros(L, 1);

% Compute no. of pixels for input2
[rows_input2, cols_input2] = size(input2);
totalPixels_input2 = rows_input2 * cols_input2;

% Compute PDF for input2
for i = 1:rows_input2
    for j = 1:cols_input2
        intensity = input2(i, j) + 1;
        input2_hist(intensity) = input2_hist(intensity) + 1;
    end
end

% Compute CDF for input2
input2_pdf = input2_hist / totalPixels_input2;
input2_cdf = cumsum(input2_pdf);

% Perform Histogram Specification
output_image = zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        intensity = input(i, j) + 1;
        [~, index] = min(abs(input_cdf(intensity) - input2_cdf));
        output_image(i, j) = index - 1;
    end
end

% Display histogram specified image
figure;
subplot(2, 2, 1);
imshow(output_image, []);
title('Histogram Specified Image');

% Display input2 histogram
subplot(2, 2, 2);
bar(input2_hist);
xlabel('Gray Level Intensity');
ylabel('Number of Pixels');
title('Input2 Histogram');

% Compute histogram of histogram specified image
output_hist = zeros(L, 1);
for i = 1:L
    output_hist(i) = sum(sum(output_image == i-1));
end

% Display histogram of histogram specified image
subplot(2, 2, 3);
bar(output_hist);
xlabel('Gray Level Intensity');
ylabel('Number of Pixels');
title('Histogram of Specified Image');

% Compute CDF of histogram specified image
output_cdf = cumsum(output_hist) / totalPixels;

% Display CDF of histogram specified image
subplot(2, 2, 4);
plot(output_cdf, 'LineWidth', 2);
xlabel('Gray Level Intensity');
ylabel('Cumulative Probability');
title('CDF of Specified Image');
