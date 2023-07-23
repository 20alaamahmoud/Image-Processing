function New_img=Edgedetection_filter(img)
if size(img,3) == 3 
    img = rgb2gray(img);
end
edgeFilter = [0 1 0; 1 -4 1; 0 1 0];
[r, c] = size(img);
[filterRows, filterCols] = size(edgeFilter);
paddedImage = padarray(img, [floor(filterRows/2) floor(filterCols/2)]);
New_img = zeros(r, c);
for i = 1:r
    for j = 1:c
        New_img(i,j) = sum(sum(edgeFilter .* double(paddedImage(i:i+filterRows-1,j:j+filterCols-1))));
    end
end
New_img = uint8(New_img);
figure,imshow(img),title('Original');
figure,imshow(New_img),title('Filtered image');
end