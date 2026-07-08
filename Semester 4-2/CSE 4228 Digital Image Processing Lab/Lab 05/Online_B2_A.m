clc; clear all; close all;

I = [0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 1 0 1 0 0;
    0 0 1 0 1 0 0;
    0 0 1 1 1 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0];

figure;
subplot(1,2,1);
imshow(I);

n = [0 1 0; 1 0 1; 0 1 0 ];
row = 3;
col = 3;

n = [1 1 1; 1 1 1; 1 1 1 ];

I2 = imdilate(I,n);

I2 = I2 - I;

subplot(1,2,2);
imshow(I2);







