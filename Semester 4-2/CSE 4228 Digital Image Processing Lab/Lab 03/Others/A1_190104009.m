input_image = imread('cameraman.png');

numLevels = 256;  
input_histogram = zeros(numLevels, 1);

[rows, cols] = size(input_image);
totalPixels = rows * cols;  

for i = 1:rows
    for j = 1:cols
        intensity = input_image(i, j) + 1;  
        input_histogram(intensity) = input_histogram(intensity) + 1;  
    end
end

input_pdf = input_histogram / totalPixels;

input_cdf = zeros(numLevels, 1);

input_cdf(1) = input_pdf(1);  

for i = 2:numLevels
    input_cdf(i) = input_cdf(i-1) + input_pdf(i);  
end

L = numLevels;  
input_cdf_normalized = input_cdf * (L - 1);

input_cdf_normalized_rounded = round(input_cdf_normalized);

subplot(2, 2, 1);
imshow(input_image);
title('Original Image');

equalized_image = input_cdf_normalized_rounded(input_image + 1);
subplot(2, 2, 2);
imshow(equalized_image, []);
title('Equalized Image');

subplot(2, 2, 3);
bar(input_histogram);
xlabel('Gray Level Intensity');
ylabel('Number of Pixels');
title('Original Histogram');

equalized_histogram = zeros(numLevels, 1);
for i = 1:numLevels
    equalized_histogram(i) = sum(sum(equalized_image == i-1));
end
subplot(2, 2, 4);
bar(equalized_histogram);
xlabel('Gray Level Intensity');
ylabel('Number of Pixels');
title('Equalized Histogram');
