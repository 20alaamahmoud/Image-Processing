function New_im = DM_0L(im,fact1)
[r, c, ch]=size(im);
New_r = r*fact1;
New_c = c*fact1;
New_im = zeros(New_r,New_c, ch);
for k=1:ch
    for i=1:r
        for j=1:c
            New_im(i*fact1+1-fact1:i*fact1,j*fact1+1-fact1:j*fact1,k)= im(i,j,k);
        end
    end
end
New_im = uint8(New_im);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('Resized')
end