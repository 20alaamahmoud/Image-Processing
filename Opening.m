function Opening(img)
gray_img = rgb2gray(img);
binary_img=im2bw(gray_img);
SE = ones(3,3);           
Eroded_img = binary_img;
for row=2:size(binary_img,1)-1
    for col=2:size(binary_img,2)-1
        if binary_img(row,col)==1 && all(all(binary_img(row-1:row+1,col-1:col+1)==1 & SE==1))
            Eroded_img(row,col) = 1;
        else
            Eroded_img(row,col) = 0;
        end
    end
end
Dilated_img = Eroded_img;
for row=2:size(Eroded_img,1)-1
    for col=2:size(Eroded_img,2)-1
        if Eroded_img(row,col)==1 || any(any(Eroded_img(row-1:row+1,col-1:col+1)==1 & SE==1))
            Dilated_img(row,col) = 1;
        else
            Dilated_img(row,col) = 0;
        end
    end
end
opened_img = Dilated_img;
%figure,imshow(binary_img),title('Original - (Binary Image)');
%figure,imshow(opened_img),title('Opened img');
figure;
subplot(1,2,1); imshow(binary_img),title('Original - (Binary Image)');
subplot(1,2,2); imshow(opened_img),title('Opened Image');
end