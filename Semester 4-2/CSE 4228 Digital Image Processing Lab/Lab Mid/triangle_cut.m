clc;
close all;

I=imread('cameraman.png');
%I=rgb2gray(I);
I=imresize(I,[256,256]);

subplot(3,2,1);
imshow(I);
[row,col]=size(I);

O=uint8(zeros(row,col));

%upper triangle
for i=1:row
    for j=1:col-i
        if i<=j
           O(i,j)=I(i,j);
        end 
    end
end    

subplot(3,2,2);
imshow(O);


O = uint8(zeros(row,col));

for i=1:row
    for j=1:col-i
        if i>=j
           O(i,j)=I(i,j);   %left triangle
        end 
    end
end    


subplot(3,2,3);
imshow(O);

O=uint8(zeros(row,col));

%bottom trianlge
n=row;

for i=1:row
    for j=i:col-i
           O(n,j)=I(n,j);
    end
    n=n-1;
end    

subplot(3,2,4);
imshow(O);


O=uint8(zeros(row,col));

%right trianlge
n=row;

for i=1:row
    for j=i:col-i
        O(j,n)=I(j,n);    
    end
    n=n-1;
end

subplot(3,2,5);
imshow(O);




