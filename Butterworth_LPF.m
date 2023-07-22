function IFFT = Butterworth_LPF(img,D0,n)
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
            H(row,col,k)=1/(1+(D(row,col)/D0)^(2*n));
            Real(row,col,k)=Real(row,col,k).*H(row,col,k);
            Imag(row,col,k)=Imag(row,col,k).*H(row,col,k);
        end
    end
end
FFT=ifftshift(Real+1i*Imag);
IFFT=ifft2(FFT);
IFFT = uint8(IFFT);
figure,imshow(img),title('Original');
figure,imshow(IFFT),title('Lowpass Butterworth Filter Image');
end