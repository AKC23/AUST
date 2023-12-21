clc; close all; clear all;

I = imread('cameraman.png');
[row, col, ~] = size(I);

figure();
subplot(2,2,1);
imshow(I);
title('Original Image');

% Add noise
%I = imnoise(I,'salt & pepper',0.02);

%adds guassian white
I = imnoise(I, 'gaussian', 0.02);


subplot(2,2,2);
imshow(I);
title('Noisy Image');

output = I;

for i=1:row-2
    for j = 1:col-2
        N = I(i:i+2, j:j+2);
        %t = mean(N(:));
        t = median(N(:));
        %t = mode(N(:));
        %t = min(N(:));
        %t = max(N(:));
        
        output(i,j) = t;
    end
end

subplot(2,2,3);
imshow(output);
title('Filtered Image');


