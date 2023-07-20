function gray = decomposing(im)
R=im(:,:,1);
G=im(:,:,2);
B=im(:,:,3);
gray =(max(max(R, G), B));
%gray =(min(min(R, G), B));
gray = uint8(gray);
figure,imshow(im),title('Original')
figure,imshow(gray),title('Dcomposing - Gray')
end