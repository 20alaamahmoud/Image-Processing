function IFT = post_processing(real_part,imag_part)
    i=sqrt(-1);
    FT=ifftshift(real_part+(i*imag_part));
    IFT=ifft2(FT);
end