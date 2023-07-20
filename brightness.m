function out_img = brightness(img,offset)
out_img = img + offset;
if(out_img > 255)
    out_img =255;
elseif(out_img < 0)
    out_img =0;
end
out_img = uint8(out_img);
figure,imshow(img),title('Original')
figure,imshow(out_img),title('brightness Image')
end
