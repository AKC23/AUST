I = imread('input3.png');
if size(I, 3) > 1
    I = rgb2gray(I);
end
J = I;
[R, C] = size(J);
for k = 1:R
    X = 2^k;
    S = bitand(J, X);
    subplot(2, 4, k);
    imshow(S);
    title(['Bit Position: ', num2str(k)]);
end
