n=13;
img=imread(['ReflectImg',int2str(n),'.jpg']);
[N_ROW,N_COL]=size(img);

img=round(img*2);
for i=1:N_ROW
    for j=1:N_COL
        if img(i,j)>255
            img(i,j)=255;
        end
    end
end

    
imshow(img);