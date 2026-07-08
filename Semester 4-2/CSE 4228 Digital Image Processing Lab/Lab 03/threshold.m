clc;
close all;

I = imread('cameraman.png');
[row, col, ~] = size(I);

X = uint8(zeros(row,col));  % not integer anymore, store double values
X = uint8(X) * 255;


subplot(3,2,1);
imshow(I);
title('Original Image');


K = zeros(1,256);

for i=1:row
    for j=1:col
        temp = I(i,j) + 1;
        K(temp) = K(temp) + 1; 
    end    
end

subplot(3,2,2);
bar(K);

% I = im2double(I);

% Threshold Image


thresholding = 100;
for i=1:row
    for j=1:col
        X(i,j) = I(i,j) > thresholding;
    end    
end

%X = I > thresholding;
%X = uint8((255 / max(X(:))) * X);
X = uint8(X) * 255;

subplot(3,2,3);
imshow(X);
title('Threshold Image');

K = zeros(1, 256);
[row, col] = size(X);

for i = 1:row
    for j = 1:col
        temp = X(i, j) + 1;
        K(temp) = K(temp) + 1;
    end
end

subplot(3,2,4);
bar(K);


subplot(3,2,5);
plot(I,X, '.-k');
title('input vs output grey level');



