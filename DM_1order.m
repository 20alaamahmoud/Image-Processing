function new_img = DM_1order(img,fact)
%Define newimage
[row,col,ch]=size(img);
new_row=row*fact;
new_col=col*fact;
new_img=zeros(new_row,new_col,ch);
r_i=zeros(1,row);
c_i=zeros(1,col);
%-- put pixel frist in right position --%
for k=1:ch
    for i=1:row
        for j=1:col
            new_img((fact*(i-1)+1),(fact*(j-1)+1),k)=img(i,j,k);
            r_i(i)=(fact*(i-1)+1);
            c_i(j)=(fact*(j-1)+1);
        end
    end
end
% ---1-order performed by interpolating pixels in-between row ----%
for k=1:ch
    for i=1:row
        for j=1:col-1
            if (new_img(r_i(i),c_i(j),k) < new_img(r_i(i),c_i(j+1),k))
                min_val = new_img(r_i(i),c_i(j),k);
                max_val = new_img(r_i(i),c_i(j+1),k);
                min_i=c_i(j);
                max_i=c_i(j+1);
            else
                max_val = new_img(r_i(i),c_i(j),k);
                min_val = new_img(r_i(i),c_i(j+1),k);
                max_i=c_i(j);
                min_i=c_i(j+1);
            end
            ip=1;
            if (min_i > max_i )
                for pix=min_i-1:-1:max_i+1
                    new_img(r_i(i),pix,k)=round((((max_val- min_val)/fact)*ip+min_val));
                    ip=ip+1;
                end
            else
                for pix=min_i+1:max_i-1
                    new_img(r_i(i),pix,k)=round((((max_val- min_val)/fact)*ip+min_val));
                    ip=ip+1;
                end
            end
            
            
        end
        new_img(r_i(i),c_i(end):end,k)=new_img(r_i(i),c_i(end),k);
    end
end
% --1-order performed by interpolating pixels in-between col--%
for k=1:ch
    for i=1:new_col
        for j=1:row-1
            if (new_img(r_i(j),i,k) < new_img(r_i(j+1),i,k))
                min_val = new_img(r_i(j),i,k);
                max_val = new_img(r_i(j+1),i,k);
                min_i=r_i(j);
                max_i=r_i(j+1);
            else
                max_val = new_img(r_i(j),i,k);
                min_val = new_img(r_i(j+1),i,k);
                max_i=r_i(j);
                min_i=r_i(j+1);
            end
            ip=1;
            if (min_i > max_i )
                for pix=min_i-1:-1:max_i+1
                    new_img(pix,i,k)=round((((max_val- min_val)/fact)*ip+min_val));
                    ip=ip+1;
                end
            else
                for pix=min_i+1:max_i-1
                    new_img(pix,i,k)=round((((max_val- min_val)/fact)*ip+min_val));
                    ip=ip+1;
                end
            end
        end
          new_img(r_i(end):end,i,k)=new_img(r_i(end),i,k);
    end
end
new_img = uint8(new_img);
figure,imshow(img),title('Original')
figure,imshow(new_img),title('Resized')
end
