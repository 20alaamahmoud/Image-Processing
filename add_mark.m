function New_im = add_mark(im,mark)
[r, c, ch]=size(im);
[rm,cm,chm]=size(mark);
New_im = zeros(r,c, ch);
if(r>rm || c>cm )
    mark = padarray(mark,[floor(abs(r-rm+1)/2),floor(abs(c-cm+1)/2)],0);
    [rm,cm,chm]=size(mark);
end
for k=1:ch
    for i=1:r
        for j=1:c
            a=im(i,j,k);
            a=bitand(a,240);
            b=mark(i,j,k);
            x = bitget(b, 5:8, 'uint8');
            str_x = num2str(x);
            b= bin2dec(str_x);
            %b=bitand(b,15);
           New_im(i,j,k)=bitor(a,b);
        end
    end
end
New_im = uint8(New_im);
figure,imshow(mark),title('Original 2')
end