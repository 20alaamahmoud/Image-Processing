function filteredImg=Weighted_Filter(img,sigma)
N=floor(3.7*sigma-0.5);
mask_size=2*N+1;
%img=im2double(img);
mask=zeros(mask_size,mask_size);
padSize = floor(mask_size/2);
X = (-padSize:padSize);
coef=(1/(2*pi*(sigma^2)));
paddedImg = padarray(img, [padSize padSize], 'replicate');
[height, width, channels] = size(img);
filteredImg = zeros(height, width, channels);
     for i=1:mask_size
         for j=1:mask_size
             mask(i,j)=coef*exp(-((X(i)^2)+(X(j)^2))/(2*(sigma^2)));
         end
     end
for ch = 1:channels
    for row = 1:height
        for col = 1:width
            %pixel = paddedImg(row+padSize, col+padSize, ch);
            neighbors = paddedImg(row:row+2*padSize, col:col+2*padSize, ch);
            weightedNeighbors = mask .* double(neighbors);
            filteredPixel = sum(weightedNeighbors(:));
            filteredImg(row, col, ch) = filteredPixel;
        end
    end
end
filteredImg = filteredImg(padSize+1:end-padSize, padSize+1:end-padSize, :);
filteredImg = uint8(filteredImg);
%figure,imshow(img),title('Original');
%figure,imshow(filteredImg),title('Resized');
end