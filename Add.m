function new_img = Add(im1,im2)
[r, c, ch] = size(im1);
imshow(im2);
ims = imresize(im2,[r, c]);
new_img=uint8(zeros(r, c, ch));
for k=1:ch
    for i=1:r
        for j=1:c
            new_img(i,j,k)=(ims(i,j,k)+im1(i,j,k));
            if(new_img(i,j,k)>255)
                new_img(i,j,k)=255;
            end
        end
    end
end
%new_img=uint8(new_img);
figure,imshow(im1),title('First Image');
figure,imshow(im2),title('Second Image');
figure,imshow(new_img),title('Added Image');
end