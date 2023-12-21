clc;
clear all;
close all;

a=imread('peppers_color.jpg');
a=rgb2gray(a);

subplot(2,2,1);
imshow(a);

prompt='Enter the sigma value:';

sigma=input(prompt);

B = imgaussfilt(a,sigma);

subplot(2,2,2);
imshow(B);

subplot(2,2,3);
imshow(abs(B-a),[0 1]);



