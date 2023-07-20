function gray = desaturation(im)
R=im(:,:,1);
G=im(:,:,2);
B=im(:,:,3);
gray =(max(max(R, G), B))+ (min(min(R, G), B))/2;
gray = uint8(gray);
figure,imshow(im),title('Original')
figure,imshow(gray),title('Desaturation - Gray')
end