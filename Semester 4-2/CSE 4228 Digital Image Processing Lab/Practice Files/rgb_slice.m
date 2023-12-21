clc;
close all;

I=imread('image1.png');
L=imread('image2.png');

figure;
imshow(I);



[row,col,ch]=size(I);
K=uint8(zeros(row,col,ch));
for i=1:row
    for j=i:col-i-1
        K(i,j,:)=I(i,j,:);
        L(i,j,:)=K(i,j,:);
    end
end

figure;
imshow(K);

figure;
imshow(L);

%imwrite(L, 'Res.png');