I = imread('cameraman.png');
if size(I, 3) > 1
    I = rgb2gray(I);
end
J = I;
mx = max(I(:));
[row, col] = size(I);
L = 2^(floor(log2(double(mx))) + 1);
hist1 = zeros(1, L);
CDF = zeros(1, L);
for i = 1:row
    for j = 1:col
        hist1(I(i, j) + 1) = hist1(I(i, j) + 1) + 1;
    end
end
PDF = hist1 / sum(hist1);
CDF(1) = PDF(1);
for i = 2:L
    CDF(i) = PDF(i) + CDF(i - 1);
end
CDF = round(CDF * (L - 1));
for i = 1:row
    for j = 1:col
        J(i, j) = CDF(I(i, j) + 1);
    end
end
hist2 = zeros(1, L);
for i = 1:row
    for j = 1:col
        hist2(J(i, j) + 1) = hist2(J(i, j) + 1) + 1;
    end
end
figure
subplot(2, 2, 1);
imshow(I);
title('Original Image');
subplot(2, 2, 2);
imshow(J);
title('Modified Image');
subplot(2, 2, 3);
bar(hist1);
title('Original Image Histogram');
subplot(2, 2, 4);
bar(hist2);
title('Modified Image Histogram');
imwrite(J, 'outputHE.png');

% Specification
I2 = imread('coins.jpg');
if size(I2, 3) > 1
    I2 = rgb2gray(I2);
end
J2 = I2;
mx2 = max(I2(:));
[row, col] = size(I2);
L = 2^(floor(log2(double(mx2))) + 1);
hist3 = zeros(1, L);
CDF2 = zeros(1, L);
for i = 1:row
    for j = 1:col
        hist3(I2(i, j) + 1) = hist3(I2(i, j) + 1) + 1;
    end
end
PDF2 = hist3 / sum(hist3);
CDF2(1) = PDF2(1);
for i = 2:L
    CDF2(i) = PDF2(i) + CDF2(i - 1);
end
CDF2 = round(CDF2 * (L - 1));
for i = 1:row
    for j = 1:col
        J2(i, j) = CDF2(I2(i, j) + 1);
    end
end
hist4 = zeros(1, L);
for i = 1:row
    for j = 1:col
        hist4(J2(i, j) + 1) = hist4(J2(i, j) + 1) + 1;
    end
end
figure
subplot(2, 2, 1);
imshow(I2);
title('Original Image');
subplot(2, 2, 2);
imshow(J2);
title('Modified Image');
subplot(2, 2, 3);
bar(hist3);
title('Original Image Histogram');
subplot(2, 2, 4);
bar(hist4);
title('Modified Image Histogram');
B = imhistmatch(I, I2);
figure
imshow(B);
imwrite(B, 'outputHEmatch.png');
