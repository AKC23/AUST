clear all;
close all;
clc;
A=imread('aust.jpg');
A=rgb2gray(A);
subplot(2,2,1*1);
imshow(A);
[row,col]=size(A);
for i=1:row
    for j=1:col
        mi(i,j)=A(i,col-j+1);
    end
end
subplot(2,2,1*2);
imshow(mi);
p=horzcat(A,mi);
subplot(2,2,2*2);
p=imresize(p,[400,800]);
imshow(p);

