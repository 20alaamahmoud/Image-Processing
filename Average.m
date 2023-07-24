function new_img=Average(img)
% Convert the input image to grayscale
gray_img = rgb2gray(img);
filter_size = 5;

% Apply the Average filter
Average_filtered_image = zeros(size(gray_img));

for i=ceil(filter_size/2):size(gray_img,1)-floor(filter_size/2)
    for j=ceil(filter_size/2):size(gray_img,2)-floor(filter_size/2)
        neighborhood = gray_img(i-floor(filter_size/2):i+floor(filter_size/2),j-floor(filter_size/2):j+floor(filter_size/2));
        Average_filtered_image(i,j) = mean(neighborhood(:));
    end
end
new_img = uint8(Average_filtered_image);
figure,imshow(gray_img),title('Original Image');
figure,imshow(new_img),title('Average Filtered Image');
end