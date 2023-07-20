function single_gray(rgb)
[r, c,ch]=size(rgb);
    for i=1:r
        for j=1:c
            rgb(i,j,1)= rgb(i,j,2);
            %rgb(i,j,2)= rgb(i,j,1);
            rgb(i,j,3)= rgb(i,j,2);
        end
    end
figure,imshow(rgb),title('Single color channel - Grayscale')
end