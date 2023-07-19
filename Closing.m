function Closing(img)
gray_img = rgb2gray(img);
binary_img=im2bw(gray_img);
SE = ones(3,3);           
Dilated_img = zeros(size(binary_img));
for row=2:size(binary_img,1)-1
    for col=2:size(binary_img,2)-1
        if any(any(binary_img(row-1:row+1,col-1:col+1)==1 & SE==1))
            Dilated_img(row,col) = 1;
        end
    end
end
Eroded_img = zeros(size(Dilated_img));
for row=2:size(Dilated_img,1)-1
    for col=2:size(Dilated_img,2)-1
        if all(all(Dilated_img(row-1:row+1,col-1:col+1)==1 & SE==1))
            Eroded_img(row,col) = 1;
        end
    end
end
closed_img = Eroded_img(2:end-1, 2:end-1);
%figure,imshow(binary_img),title('Original - (Binary Image)');
%figure,imshow(closed_img),title('Closed img');
figure;
subplot(1,2,1); imshow(binary_img),title('Original - (Binary Image)');
subplot(1,2,2); imshow(closed_img),title('Closed Image');
end