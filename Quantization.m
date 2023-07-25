function new_img = Quantization(im,g) 
[r, c, ch]=size(im);
new_img = zeros(r,c,ch);
gray_level=power(2,g);           %k represent number of bits per pixel
Gap = 256/gray_level;
Colors = Gap:Gap:256;
for k=1:ch
    for i=1:r
        for j=1:c
            temp = im(i,j,k)/Gap;
            index = floor(temp);
            if(index == 0)
                index=index+1;
            end
            new_img(i,j,k) = Colors(index);
        end
    end
end
new_img = uint8(new_img);
figure,imshow(im),title('Original RGB Image');
figure,imshow(new_img),title('Quantized Image');