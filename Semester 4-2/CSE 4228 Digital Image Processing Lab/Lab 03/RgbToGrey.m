rgbImage = imread('peppers_color.png');  % Replace 'input_image.jpg' with the path to your RGB image

% Convert RGB image to grayscale
grayImage = rgb2gray(rgbImage);

% Save grayscale image
imwrite(grayImage, 'output_image.jpg');  % Replace 'output_image.jpg' with the desired output file name and format
