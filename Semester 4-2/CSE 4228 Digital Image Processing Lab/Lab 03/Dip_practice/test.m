% Input image
input_image = imread('cameraman.png'); % Replace 'input_image.jpg' with your image file name or path

% Thresholding
threshold = 128; % Threshold value
output_image = input_image > threshold;

% Convert logical image to uint8 for visualization
output_image = uint8(output_image) * 255;

% Display the input and output histograms
subplot(2, 2, 1);
imshow(input_image);
title('Input Image');

subplot(2, 2, 2);
imhist(input_image);
title('Input Histogram');

subplot(2, 2, 3);
imshow(output_image);
title('Thresholded Image');

subplot(2, 2, 4);
imhist(output_image);
title('Output Histogram');

% Save the thresholded image
imwrite(output_image, 'output_image.jpg'); % Replace 'output_image.jpg' with your desired output file name or path
