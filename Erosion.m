function Erosion(img)
binary_img=im2bw(img);
SE = ones(5,5);           %we can do Dilation by 3*3, 5*5 or 7*7 square structuring element
rows_SE=size(SE, 1);
cols_SE=size(SE, 2);
pad_img = padarray(binary_img, [floor(rows_SE/2) floor(cols_SE/2)], 1);
Eroded_img=zeros(size(binary_img));
for row = 1:size(binary_img, 1)
    for col = 1:size(binary_img, 2)
        neighborhood=pad_img(row:row+size(SE,1)-1, col:col+size(SE,2)-1); 
        out_img=neighborhood & SE;
        if all(out_img(:))
            Eroded_img(row,col)=1;
        end
    end
end
%figure,imshow(binary_img),title('Original - (Binary Image)');
%figure,imshow(Eroded_img),title('Eroded Image');
figure;
subplot(1,2,1); imshow(binary_img),title('Original - (Binary Image)');
subplot(1,2,2); imshow(Eroded_img),title('Eroded Image');
end