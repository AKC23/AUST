clc; clear all; close all;

I=[0 0 0 0 0 0 0;
0 0 0 0 0 0 0;
0 0 1 0 1 0 0;
0 0 1 0 1 0 0;
0 0 1 1 1 0 0;
0 0 0 0 0 0 0;
0 0 0 0 0 0 0];

figure;
subplot(2,2,1);
imshow(I);

n = [0 1 0; 1 0 1; 0 1 0 ];
% n = [1 1 1; 1 1 1; 1 1 1 ];

subplot(2,2,2);
imshow(n);

SE = strel(n);

disp(SE);

I2 = imdilate(I, SE);
I2 = I2-I;

subplot(2,2,3);
imshow(I2);



