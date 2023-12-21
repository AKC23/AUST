I = imread('peppers_color.jpg');
figure; 
I=rgb2gray(I);
imshow(I);
I=im2double(I);
[row, col] = size(I);
K = zeros(row, col);
c=1;
gammaa=2;
for i = 1:row
   for j = 1:col
          K(i,j) = c*(I(i,j).^gammaa);
        end
   end
   figure; imshow(K);
   figure;
   plot(I,K,'.r');

