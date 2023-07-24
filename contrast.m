function cont = contrast(im)
[r, c, ch]=size(im);
im=im2double(im);
new_max=10;
new_min=220;
old_max=max(im(:,:,:));
old_min=min(im(:,:,:));
for k=1:ch
    for i=1:r
        for j=1:c
            if(im(i,j,k)>=old_max) 
                old_max=im(i,j,k);
            end
            if(im(i,j,k)<=old_min) 
                old_min=im(i,j,k);
            end
        end
    end
end
cont=(((im - old_min)/(old_max - old_min))*((new_max - new_min) + new_min));
figure,imshow(im),title('Original')
figure,imshow(cont),title('Contrast adjustment - Histogram Stretch')
end