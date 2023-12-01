clc;
close all;

% 1. Took two input pictures.
img1 = imread('input1.jpg');
img2 = imread('input2.jpg');

img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

img1 = imresize(img1, [300, 300]);
img2 = imresize(img2, [300, 300]);

% 2. Took a blank image.
[height, width, ~] = size(img1);
blankImage = uint8(zeros(height, width));

% 3. Divided the blank image into 6 rows
% 4. Replaced the odd rows with the portion of the first image and even rows with the portion of the second image.
for row = 1:6
    rowStart = (row - 1) * height / 6 + 1;
    rowEnd = row * height / 6;
    
    if mod(row, 2) == 1
        blankImage(rowStart:rowEnd, :, :) = img1(rowStart:rowEnd, :, :);
    else
        blankImage(rowStart:rowEnd, :, :) = img2(rowStart:rowEnd, :, :);
    end
end

% 5. Rotate the picture by 90 degrees without using built-in function
rotatedImage = zeros(width, height, 3, 'uint8');
for i = 1:width
    for j = 1:height
        rotatedImage(height - j + 1, i, :) = blankImage(i, j, :);
    end
end

figure;
subplot(1, 2, 1);
imshow(img1);
title('Image 1');

subplot(1, 2, 2);
imshow(img2);
title('Image 2');

% Display the new image
figure;
rotatedImage = imresize(rotatedImage,[300, 300]);
%rotatedImage = rgb2gray(rotatedImage);

imshow(rotatedImage);
title('Modified Image');
imwrite(rotatedImage, 'output.jpg');

