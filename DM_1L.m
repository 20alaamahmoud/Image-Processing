function DM_1L(im,fact)
[r, c, ch]=size(im);
New_r = r*fact;
New_c = c*fact;
New_im = zeros(New_r,New_c, ch);
for k=1:ch         
    for i=1:r
        for j=1:c 
            %to add original pixels from old image in new image
            New_im((i*fact+1-fact),(j*fact+1-fact),k)= im(i,j,k);
        end
    end
end
    for k=1:ch
        rowIndex=1;
        for i=1:fact:New_r
            colIndex=1;
            for j=1:fact:New_c
                v1=im(rowIndex,colIndex,k);
                if j == ((c*fact) - (fact-1))
                    v2 = im(rowIndex,colIndex,k);
                else
                    v2 = im(rowIndex,colIndex+1,k);
                end
                if v1 > v2        %to know the minimum or maximum pixel value in current location
                    max = v1;
                    min = v2;
                    res = 1; 
                else
                    max = v2;
                    min = v1;
                    res = 0;
                end
                s = j+1;  % to move to second pixel to assign its value
                
                if res == 1
                    it=1 ;  %(it) Iterates according to number of pixels in between
                    while (it<fact)
                       
                        New_im(i,s,k) = round(((max - min)/fact)*it + min); 
                        s = s + 1;
                        it = it + 1;
                    end
                else
                    it=fact-1;
                    while (it>=1) 
                        
                        New_im(i,s,k) = round(((max - min)/fact)*it + min);
                        s = s + 1;
                        it = it - 1;
                    end
                end
                colIndex=colIndex+1;
            end
            rowIndex=rowIndex+1;
        end
    end
    for k=1:ch
        for i=1:New_c
            for j=1:fact:New_r
                v1=New_im(j,i,k);
                if j == ((r*fact) - (fact-1))
                    v2 = New_im(j,i,k);
                else
                    v2 = New_im(j+fact,i,k);
                end
                %to know the minimum or maximum pixel value in current location
                if v1 > v2
                    max = v1;
                    min = v2;
                    res2 = 1; 
                else
                    max = v2;
                    min = v2;
                    res2 = 0;
                end
                s = j+1;
                
                if res2 == 1
                    it=1;
                    while (it<fact)
                        New_im(s,i,k) = round(((max - min)/fact)*it + min); 
                        s = s + 1;
                        it = it + 1;
                    end
                else
                    it=fact-1;
                    
                    while (it>=1) 
                        New_im(s,i,k) = round(((max - min)/fact)*it + min);
                        s = s + 1;
                        it = it - 1;
                    end
                end
            end
        end
    end
New_im = uint8(New_im);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('Resized')
end