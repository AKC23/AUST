% Read the input images
img1 = imread('img1.jpg');
img2 = imread('img2.jpg');

% Get the size of the input images
[height, width, ~] = size(img1);

% Create a blank image with 6 rows
blankImage = uint8(zeros(6 * height / 6, width, 3));

% Divide the blank image into 6 rows
rows = reshape(1:size(blankImage, 1), height/6, 6);

% Replace odd rows with portion from image1 and even rows with portion from image2
blankImage(rows(:, 1:2:end), :, :) = img1;
blankImage(rows(:, 2:2:end), :, :) = img2;

% Display the resulting image
imshow(blankImage);

