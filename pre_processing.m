function [real_part,imag_part] = pre_processing(im)
    FT=fft2(im);
    FTS=fftshift(FT);
    real_part=real(FTS);
    imag_part=imag(FTS);
end