
clc;
clear all;
close all;

I = imread('bean.jpg');
I1 = imfinfo('bean.jpg');

if (I1.BitDepth==24)
    I=rgb2gray(I);
end
% I=I';

subplot(2,2,1);
imshow(I);

imwrite(I,'Gray Scale_Input Image.jpg');
title('Input Image');

prompt='Enter the signma value: ';
sigma=input(prompt);

IN=imnoise(I,'Gaussian',0.04,0.003); % mean=0.04, std dev = 0.003

subplot(2,2,2);

imshow(IN);
title('Noisy Image');
imwrite(IN,'Noisy Image.jpg');

IN=im2double(IN);
[row,col]=size(IN);

%mod(38,4)=2
kernel_size=7;
init_val=-3;
filter_x=zeros(kernel_size,kernel_size);
filter_y=zeros(kernel_size,kernel_size);

val=init_val;

for i=1:7
    filter_x(:,i)=val;
    val=val+1;
end

val2=init_val;
for i=1:7
    filter_y(i,:)=val2;
    val2=val2+1;
end

bI=zeros(row+6,col+6);
[row2,col2]=size(bI);
bI(4:row2-3,4:col2-3)=IN(:,:);

filter = gaussian_filter(filter_x,filter_y,sigma);
output=ones(row,col);

 for i=4:row+3
     for j=4:col+3
         val2=bI(i-3:i+3,j-3:j+3).*filter;
         val2=sum(sum(val2));
         output(i,j)=val2;
     end
 end
 
subplot(2,2,3);
imshow(output);
title('Filtered Image');
imwrite(output,'Filtered Image.jpg');


function filterf = gaussian_filter(filter_x, filter_y, sigma)
    filterf = -((filter_x.^2 + filter_y.^2) / (2 * sigma^2));
    disp(filterf);
    filterf = exp(filterf);
    filterf=(1/(2*3.14*(sigma^2))).*filterf;
    filterf = filterf / sum(sum(filterf));  
    disp(filterf);
end


