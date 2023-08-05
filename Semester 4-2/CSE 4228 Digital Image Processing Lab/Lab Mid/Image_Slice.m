clc;
close all;

I = imread('oppenheimer.jpg');
I2 = imread('cameraman.png');
I = rgb2gray(I);

disp(size(I));
disp(size(I2));

I = imresize(I,[500,500]);
I2 = imresize(I2,[500,500]);

[row,col, ~] = size(I);

disp('after resize');
disp(size(I));
disp(size(I2));

disp(row);
disp(col);

subplot(2,2,1);
imshow(I);

O = uint8(zeros(row,col));

% row slicing
%for row = 1:6
%    rowStart = (row - 1) * col / 6 + 1;
%    rowEnd = row * col / 6;
    
%    if mod(row,2) == 1
%        I2(rowStart:rowEnd, :, :) = I(rowStart:rowEnd, :, :); 
%    end
%end

% column slicing
for col = 1:6
    colStart = (col - 1) * row / 6 + 1;
    colEnd = col * row / 6;
    
    if mod(col,2) == 1
        I2(: ,colStart:colEnd, :) = I( : ,colStart:colEnd, :); 
    end
end

subplot(2,2,2);
imshow(I2);


