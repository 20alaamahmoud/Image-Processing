function IFFT = Ideal_HPF(img,D0)
gray_img=rgb2gray(img);
FTT = fft2(gray_img);       %Apply FFT
FTS = fftshift(FTT);        %Shift FFT
Real = real(FTS);           %Separate real and imaginary parts
Imag = imag(FTS);
[r, c, ch]=size(gray_img);
D = zeros(r,c,ch);
H = zeros(r,c,ch);
for k=1:ch
    for row=1:r
        for col=1:c
            D(row,col,k)=((row-r/2)^2 + (col-c/2)^2 )^(1/2);
            if(D(row,col,k) <= D0)
                H(row,col,k)=1;
            else
                H(row,col,k)=0;
            end 
            H(row,col)=1-H(row,col);
            Real(row,col,k)=Real(row,col,k).*H(row,col,k);
            Imag(row,col,k)=Imag(row,col,k).*H(row,col,k);
        end
    end
end
FTT = ifftshift(Real + 1i * Imag);
IFFT = ifft2(FTT);        %Apply IFFT 
IFFT=uint8(IFFT);
figure,imshow(img),title('Original')
figure,imshow(IFFT),title('Highpass Ideal Filter Image')
end