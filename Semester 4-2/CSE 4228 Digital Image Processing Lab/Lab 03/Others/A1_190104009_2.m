rgb_image = imread('input3.png');

gray_image = rgb2gray(rgb_image);

[rows, cols] = size(gray_image);

gray_image = double(gray_image);

for k = 0:7
    X = 2^k;
    
    bitwise_and_image = bitand(gray_image, X);
    
    bitwise_and_image = uint8(bitwise_and_image);
    
    subplot(2, 4, k+1);
    imshow(bitwise_and_image);
    title(['Bit Position: ', num2str(k)]);
end
