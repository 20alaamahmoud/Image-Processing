function new_img = Histogram_Equalization(im)
[r, c]=size(im);
new_img=uint8(zeros(1,256));
total_no_of_pixels=r*c;
freq=zeros(256,1);
pdf=zeros(256,1);          %probability density function " # Pixels "
cdf=zeros(256,1);          %cumulative density function " Ruuning Sum "
cum=zeros(256,1);          %cumulative " Divide $ Multiply "
out=zeros(256,1);

for i=1:r
    for j=1:c
        value=im(i,j);
        freq(value+1)=freq(value+1)+1;
        pdf(value+1)=freq(value+1)/total_no_of_pixels;
    end
end
sum=0; L=255;
for i=1:size(pdf)
    sum=sum+freq(i);
    cum(i)=sum;
    cdf(i)=cum(i)/total_no_of_pixels;
    out(i)=round(cdf(i)*L);
end
for i=1:r
    for j=1:c
        new_img(i,j)=out(im(i,j)+1);
    end
end

%new_img =uint8(new_img); 
%he=histeq(new_img);
%figure,imshow(he),title('Histogram Equalization');
figure,subplot(2,1,1),imshow(new_img),title('Histogram Equalization'),subplot(2,1,2),imshow(im),title('Original');
figure,histogram(new_img),title('Equalized Histogram')
figure,histogram(im),title('Original Histogram');
end 