function img = salt_and_pepper(img)
density = 0.5;     
[r,c] = size(img);
noise = rand(r,c);
salt = noise < density/2;
pepper = noise < density/2;
img(salt) = 255;
img(pepper) = 0;
figure,imshow(img),title('Noisy Image');
end