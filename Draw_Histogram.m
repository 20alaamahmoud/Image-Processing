function new_img = Draw_Histogram(im)
%im = imread('download.jfif');
new_img=rgb2gray(im); 
[r, c] = size(new_img);
frequency = 1 : 256;
n = 0 : 255;
count = 0;
for i = 1 : 256
    for j = 1 : r
        for k = 1 : c
            if new_img(j, k) == i-1
                    count = count + 1;
            end
        end
    end
    frequency(i) = count;
    count = 0;
end 
figure,histogram(new_img),title('HISTOGRAM');
%stem(n, frequency);
%bar(n, frequency);
%title('HISTOGRAM');
end