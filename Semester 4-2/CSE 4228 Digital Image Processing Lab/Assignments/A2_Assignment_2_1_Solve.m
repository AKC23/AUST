clc;
close all;

%a. First Image
input1_image = imread('cameraman.png');

output1_image = input1_image;

mx1 = max(input1_image(:));

[row, col] = size(input1_image);

%b. Compute no. of pixels 
totalPixels = row * col;  
disp(totalPixels);

L1 = 2^(floor(log2(double(mx1))) + 1);

input1_histogram = zeros(1, L1);
CDF1 = zeros(1, L1);

% Compute pdf
for i = 1:row
    for j = 1:col
        input1_histogram(input1_image(i, j) + 1) = input1_histogram(input1_image(i, j) + 1) + 1;
    end
end

PDF1 = input1_histogram / totalPixels;


% d. Compute cdf
CDF1(1) = PDF1(1);

for i = 2:L1
    CDF1(i) = PDF1(i) + CDF1(i - 1);
end

% e and f. Multiply each CDF by L-1 and Round the value 
CDF1 = round(CDF1 * (L1 - 1));

% Perform histogram equalization on input1_image
for i = 1:row
    for j = 1:col
        output1_image(i, j) = CDF1(input1_image(i, j) + 1);
    end
end

output1_histogram = zeros(1, L1);

% Compute histogram for the equalized image
for i = 1:row
    for j = 1:col
        output1_histogram(output1_image(i, j) + 1) = output1_histogram(output1_image(i, j) + 1) + 1;
    end
end

% g. and h. Display images and histograms
figure
subplot(2, 2, 1);
imshow(input1_image);
title('Original Image 1');

subplot(2, 2, 2);
bar(input1_histogram);
title('Original Image 1 Histogram');

subplot(2, 2, 3);
imshow(output1_image);
title('Modified Image 1');

subplot(2, 2, 4);
bar(output1_histogram);
title('Modified Image 1 Histogram');

% i. Histogram Specification
input2_image = imread('peppers_color_gray.jpg');
if size(input2_image, 3) > 1
    input2_image = rgb2gray(input2_image);
end

output2_image = input2_image;

mx2 = max(input2_image(:));
[row, col] = size(input2_image);

L2 = 2^(floor(log2(double(mx2))) + 1);

input2_histogram = zeros(1, L2);
CDF2 = zeros(1, L2);

% Compute histogram and CDF for input2_image
for i = 1:row
    for j = 1:col
        input2_histogram(input2_image(i, j) + 1) = input2_histogram(input2_image(i, j) + 1) + 1;
    end
end

PDF2 = input2_histogram / sum(input2_histogram);
CDF2(1) = PDF2(1);

for i = 2:L2
    CDF2(i) = PDF2(i) + CDF2(i - 1);
end

CDF2 = round(CDF2 * (L2 - 1));

% Perform histogram specification on input2_image
for i = 1:row
    for j = 1:col
        output2_image(i, j) = CDF2(input2_image(i, j) + 1);
    end
end

output2_histogram = zeros(1, L2);

% Compute histogram for the specified image
for i = 1:row
    for j = 1:col
        output2_histogram(output2_image(i, j) + 1) = output2_histogram(output2_image(i, j) + 1) + 1;
    end
end

% Display results for second image
figure
subplot(2, 2, 1);
imshow(input2_image);
title('Original Image 2');

subplot(2, 2, 2);
bar(input2_histogram);
title('Original Image 2 Histogram');

subplot(2, 2, 3);
imshow(output2_image);
title('Modified Image 2');

subplot(2, 2, 4);
bar(output2_histogram);
title('Modified Image 2 Histogram');

% Histogram Specification
output3 = imhistmatch(input1_image, input2_image);
figure
subplot(1, 2, 1);
imshow(output3);
title('Histogram Specified Image');

subplot(1, 2, 2);
output3_histogram = imhist(output3);
bar(output3_histogram);
title('Histogram of Output3 Image');
