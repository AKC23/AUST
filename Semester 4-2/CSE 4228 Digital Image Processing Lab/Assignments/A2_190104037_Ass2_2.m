clc;
close all;

%a. RGB input image and convert to grayscale
rgb_image = imread('input3.jpg');
gray_image = rgb2gray(rgb_image);

%b. Extract the dimension of the grayscale 
[rows, cols, channels]  = size(gray_image);
gray_image = double(gray_image);

disp(['Image dimensions: ', num2str(rows), ' x ', num2str(cols), ' x ', num2str(channels)]);

info = imfinfo('input3.jpg');
%bitDepth = info.BitDepth;
bitDepth = 8; %Grayscale image
disp(['Bit depth: ', num2str(bitDepth)]);
disp(info);

for k = 0:bitDepth-1
    X = 2^k;
    bitwise_and_image = bitand(gray_image, X);
    bitwise_and_image = uint8(bitwise_and_image);
    subplot(2, bitDepth/2, k+1);
    imshow(bitwise_and_image);
    title(['Bit Position: ', num2str(k)]);
end


