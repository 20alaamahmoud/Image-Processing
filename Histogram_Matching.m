function matched = Histogram_Matching(im1,im2)
img1 =rgb2gray(im1);
img2 =rgb2gray(im2);
hist =uint8(zeros(265, 1));
hist1=imhist(img1);
hist2=imhist(img2);
cdf1 = cumsum(hist1) / numel(im1);   %cumulative density function " Ruuning Sum " of original image
cdf2 = cumsum(hist2) / numel(im2);  %cumulative density function of reference image
for i = 1:256
    [~,s] = min(abs(cdf1(i)- cdf2));
    hist(i) = s-1;   % s from 1 : 265 , but hist(r) from 0 : 255
end
matched=hist(double(im1)+1);
%figure,subplot(2,1,1),imshow(im1),title('Original image 1'),subplot(2,1,2),imshow(im2),title('Original image 2');
%figure,imshow(matched),title('Matched Image');
%figure,histogram(im1),title('Original Histogram im1');
%figure,histogram(im2),title('Original Histogram im2');
figure,histogram(matched),title('Matched Histogram')
%subplot(2,3,1),imshow(im1),title('Original image 1');
%subplot(2,3,2),imshow(im2),title('Original image 2');
%subplot(2,3,3),histogram(im1),title('Original Histogram of image 1');
%subplot(2,3,4),histogram(im2),title('Original Histogram of image 2');
%subplot(2,3,5),imshow(matched),title('Matched Image');
%subplot(2,3,6),histogram(matched),title('Histogram of Matched Image');
end