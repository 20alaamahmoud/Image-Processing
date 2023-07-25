
function gray_im =to_gray(rgb)

gray_im = (0.3*rgb(:,:,1))+ (0.59*rgb(:,:,2))+(0.11*rgb(:,:,3));

gray_im=uint8(gray_im);

end
