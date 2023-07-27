function midPoint (img , s)
  [r, c ,ch] = size(img);
  new_img = ones(r, c,ch);
  mask = s * s;
  start = floor(s/2);
  end_r = r - start -1 ;
  end_c = c - start - 1;
  for i = start:end_r
    for j = start:end_c
      for k = 1:ch
        result = img(i:i+s-1, j:j+s-1,k);
        b = sum(result);
        new_img(i, j,k) = sum(b,2);
        new_img(i, j,k) = new_img(i, j,k) / mask;
      end
    end
  end
  new_img = uint8(new_img);
  figure,imshow(img),title('Original Image');
  figure,imshow(new_img),title('Mid-Point Image');
end
