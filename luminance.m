function gray = luminance(rgb)
gray=(0.3*rgb(:,:,1))+(0.59*rgb(:,:,2))+(0.11*rgb(:,:,3));
gray = uint8(gray);
figure,imshow(rgb),title('Original')
figure,imshow(gray),title('Luminance - Gray')
end