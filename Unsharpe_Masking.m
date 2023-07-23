function filteredImg=Unsharpe_Masking(img,filterSize)
kernel = ones(filterSize) / filterSize^2;
padSize = floor(filterSize/2);
paddedImg = padarray(img, [padSize padSize], 'replicate','both');
[height, width, channels] = size(img);
filteredImg = zeros(height, width, channels);
for ch = 1:channels
    for row = 1:height
        for col = 1:width
            neighbors = paddedImg(row:row+2*padSize, col:col+2*padSize, ch);
            filteredPixel = sum(sum(kernel .* double(neighbors)));
            filteredImg(row, col, ch) = filteredPixel;
        end
    end
end
filteredImg = filteredImg(padSize+1:end-padSize+1, padSize:end-padSize+1, :);
filteredImg = uint8(filteredImg);
[row, col, ~]=size(img);
filteredImg_r = imresize(filteredImg, [row, col]);
x=img-filteredImg_r;
Unsharpe_Masking=x+img;
Unsharpe_Masking = uint8(Unsharpe_Masking);
figure,imshow(img),title('Original');
figure,imshow(Unsharpe_Masking),title('Resized');
end