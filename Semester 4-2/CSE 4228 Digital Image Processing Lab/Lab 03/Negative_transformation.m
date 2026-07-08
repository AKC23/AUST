clc;
close all;

I = imread('cameraman.png');
[row, col] = size(I);

subplot(3,2,1);
imshow(I);
title('Original Image');

X = uint8(zeros(row,col));
K = zeros(1,256);

for i=1:row
    for j=1:col
        temp = I(i,j) + 1;
        K(temp) = K(temp) + 1; 
    end    
end

subplot(3,2,2);
bar(K);

for i=1:row
    for j=1:col
        X(i,j) = 255 - I(i,j); 
    end    
end
% X = 255 - I;

subplot(3,2,3);
imshow(X);
title('Negative Transformed Image');

K = zeros(1,256);

for i=1:row
    for j=1:col
        temp = X(i,j) + 1;
        K(temp) = K(temp) + 1; 
    end    
end

subplot(3,2,4);
bar(K);


subplot(3,2,5);
plot(I,X, '.-k');
title('input vs output grey level');



