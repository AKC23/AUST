%clc; clear all; close all;

I = imread('peppers.png');
I_info = imfinfo('peppers.png');
I = imresize(I, [300, 300]);
[row, col,~] = size(I);
I = im2double(I);

subplot(3,2,1);
imshow(I);
title('Input Image');

if (I_info.BitDepth==24)
    I = rgb2gray(I);
end
disp(I_info.BitDepth);

subplot(3,2,2);
imshow(I);
title('Grayscale Image');

value = 'Enter the signma value: ';
sigma= input(value);

kernel = 5; %37 mod 4 = 1 -> 5*5 kernel
init_val = -2;
filter_x = zeros(kernel, kernel);
filter_y = zeros(kernel, kernel);

val = init_val;

for i = 1:kernel
    filter_x(:, i) = val;
    val = val + 1;
end

subplot(3,2,3);
imshow(filter_x);
title('Filter X');

val2 = init_val;
for i = 1:kernel
    filter_y(i, :) = val2;
    val2 = val2 + 1;
end

subplot(3,2,4);
imshow(filter_y);
title('Filter Y');

bI = zeros(row+4, col+4);
[row2, col2] = size(bI);
bI(3:row+2, 3:col+2) = I;

filter = gaussian_filter(filter_x, filter_y, sigma);
output = zeros(row, col);

for i = 3:row+2
    for j = 3:col+2
        val2 = bI(i-2:i+2, j-2:j+2) .* filter;
        val2 = sum(val2(:));
        output(i-2, j-2) = val2;
    end
end

subplot(3,2,5);
imshow(output);
title('Filtered Image');

function filterf = gaussian_filter(filter_x, filter_y, sigma)
    filterf = -((filter_x.^2 + filter_y.^2) / (2 * sigma^2));
    filterf = exp(filterf);
    filterf = (1 / (2 * pi * (sigma^2))) .* filterf;
    filterf = filterf / sum(filterf(:));
end


