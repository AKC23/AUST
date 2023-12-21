clc; clear all; close all;

I = imread('concoin.png');
f = rgb2gray(I);

subplot(2,3,1);
imshow(f);
title('Original Image');

f = imbinarize(f);
subplot(2,3,2);
imshow(f);
title('Binarize Image');

[row,col] = size(f);
output = zeros(row,col);


%Erosion
w = [1 1 1;1 1 1;1 1 1];
for s = 2:row-1
    for t = 2:col-1
        w11 = [f(s-1,t-1) *w(1,1) f(s-1,t) *w(1,2) f(s-1,t+1) *w(1,3) f(s,t-1) *w(2,1) f(s,t) *w(2,2) f(s,t+1) *w(2,3) f(s+1,t-1) *w(3,1) f(s+1,t) *w(3,2) f(s+1,t+1) *w(3,3)];                             
        output(s,t) = min(w11);
    end
end

subplot(2,3,3);
imshow(output);
title('Eroded Image');

%Dilation
w = [1 1 1;1 1 1;1 1 1];
for s = 2:row-1
    for t = 2:col-1
        w12 = [f(s-1,t-1) *w(1,1) f(s-1,t) *w(1,2) f(s-1,t+1) *w(1,3) f(s,t-1) *w(2,1) f(s,t) *w(2,2) f(s,t+1) *w(2,3) f(s+1,t-1) *w(3,1) f(s+1,t) *w(3,2) f(s+1,t+1) *w(3,3)];                             
        output(s,t) = max(w12);
    end
end

subplot(2,3,4);
imshow(output);
title('Dilated Image');


% Opening





