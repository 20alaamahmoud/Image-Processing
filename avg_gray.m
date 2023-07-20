function gray = avg_gray(im)
R=im(:,:,1);
G=im(:,:,2);
B=im(:,:,3);
gray=(R+G+B)/3;
end