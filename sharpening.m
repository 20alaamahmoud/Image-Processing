function New_image = sharpening(img)
if size(img,3) == 3 
gray_img = rgb2gray(img);
end
sharp_filter = [-1 -1 -1; -1 9 -1; -1 -1 -1];
sharp_img = conv2(gray_img,sharp_filter);
New_image = uint8(sharp_img);
figure,imshow(gray_img),title('Original');
figure,imshow(New_image),title('sharpped');
end

