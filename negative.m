function neg = negative(im)
max = 256;                       
neg = (max - 1) - im;   
neg = uint8(neg);
figure,subplot(2,1,1),imshow(im),title('Original'),subplot(2,1,2),imshow(neg),title('Negative Image');
end