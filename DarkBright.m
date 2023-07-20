function new_img = DarkBright(img, offset)
[r, c, ch] = size(img);
new_img = zeros(r, c, ch);
for k=1:ch
    for i=1:r
        for j=1:c
            new_val = img(i,j,k)+offset;
            if (new_val > 255)
                new_val = 255;
            end
            if (new_val < 0 )
                new_val = 0;
            end
            new_img(i,j,k) = new_val;
        end
    end
end
new_img=uint8(new_img);
figure,imshow(img),title('Original Image');
figure,imshow(new_img),title('DarkBright Image');
end