im = imread('download.jfif');
im=rgb2gray(im); 
[r, c] = size(im);
frequency = 1 : 256;
n = 0 : 255;
count = 0;
for i = 1 : 256
    for j = 1 : r
        for k = 1 : c
            if im(j, k) == i-1
                    count = count + 1;
            end
        end
    end
    frequency(i) = count;
    count = 0;
end 
histogram(im);
%stem(n, frequency);
%bar(n, frequency);
title('HISTOGRAM');