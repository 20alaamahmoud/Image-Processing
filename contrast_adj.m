function out_img=contrast_adj(img,new_min,new_max)
[row, col, ch]=size(img);
img=double(img);
for k=1:ch
old_min=min(img(:,:,k));
old_max=max(img(:,:,k));
out_img = (((img - old_min(1))/(old_max(1) - old_min(1))) * ((new_max - new_min) + new_min));
end
%Post-processing
if(out_img > 255)
    out_img = 255;
elseif(out_img < 0)
    out_img = 0;
end
out_img = uint8(out_img);
% img = uint8(img);
figure,imshow(out_img),title('contrast');
end
