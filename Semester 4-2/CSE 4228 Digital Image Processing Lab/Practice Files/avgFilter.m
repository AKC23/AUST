

function avgFilter()
    clc;
    clear all;
    close all;
    
    S = rgb2gray(imread('coloredChips.png'));
    R = S;
    [row, col] = size(S);
    
    S = imnoise(S, 'salt & pepper', 0.02);
    
    for i = 1:row-4
       for j = 1:col-4 
           
           N = S(i:i+4, j:j+4);
           t = mean(N(:));
           %t = min(N(:));
           %t = max(N(:));
           
           R(i,j) = t;
           
       end
    end

    subplot(2,2,1); 
    imshow(S);
    subplot(2,2,2);
    imshow(R);
    subplot(2,2,3);
    imshow(abs(R - S), [0 1])
    
end






