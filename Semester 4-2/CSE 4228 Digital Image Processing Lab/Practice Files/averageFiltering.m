clc;
clear all;
close all;
an=imread('cameraman.png');

[m,n]=size(an);

subplot(2,2,1);
imshow(an);

b=input('Enter Averaging Mask size: ');
z=ones(b);
[p,q]=size(z);
w=1:p;
x=round(median(w)); % median Padding

anz = zeros(m+2*(x-1),n+2*(x-1));

% Padding the image
for i=x:(m+(x-1))
    for j=x:(n+(x-1))
        anz(i,j)=an(i-(x-1),j-(x-1));
    end
end

subplot(2,2,2);
imshow(uint8(anz));

sum=0;
x=0;
y=0;
for i=1:m
    for j=1:n
        for k=1:p
            for l=1:q 
                sum = sum+anz(i+x,j+y)*z(k,l);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        anz(i,j)=(1/(p*q))*(sum);
        sum=0;
    end
end

subplot(2,2,3);
imshow(uint8(anz));

