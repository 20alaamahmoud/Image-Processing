function new_image=quantization(img,k)
[row,col,ch]=size(img);
new_image=zeros(row,col,ch);
gray_levels = 2^k;
gap= 256/ gray_levels;
colors= 0:gap:256;
for k=1:ch
    for i=1:row
        for j=1:col
        temp=img(i,j,k)/gap;
        index=floor(temp);
        new_image(i,j,k) = colors(index+1);
        end
    end
end
new_image = uint8(new_image);
figure,imshow(new_image),title('quantization image');
end
