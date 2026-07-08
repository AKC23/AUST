clc;
close all;

I = imread('cameraman.png');
[row, col, ~] = size(I);

X = zeros(row,col);  % not integer anymore, store double values

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

I = im2double(I);

% nth power Transformed Image
gamma = 2;
c = 1;

for i=1:row
    for j=1:col
        X(i,j) = c * I(i,j).^gamma; 
    end    
end

%X = uint8((255 / max(X(:))) * X);
% X = c *(I.^gamma);



subplot(3,2,3);
imshow(X);
title('nth power Transformed Image');

K = zeros(1, 256, 'double');

for i = 1:row
    for j = 1:col
        temp = round(X(i, j) * 255) + 1;
        K(temp) = K(temp) + 1;
    end
end

subplot(3,2,4);
bar(K);


subplot(3,2,5);
plot(I,X, '.-k');
title('input vs output grey level');



