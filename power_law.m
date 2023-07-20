function  out_img = power_law(img,gamma)
out_img=im2double(img);
out_img=out_img.^gamma;
%Post-processing
% out_img=contrast_adj(out_img,0,255);
% out_img = uint8(out_img);
figure,imshow(img),title('Original');
figure,imshow(out_img),title('After Gamma Correction');
end