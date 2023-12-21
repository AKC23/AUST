

% Create a square structuring element of size 5x5
SE = strel('square', 5);
disp(SE);


% Create a disk-shaped structuring element with a radius of 3 pixels
SE_disk = strel('disk', 3);
disp(SE_disk);


% Create a line-shaped structuring element with a length of 7 pixels at an angle of 45 degrees
SE_line = strel('line', 7, 45);
disp(SE_line);










