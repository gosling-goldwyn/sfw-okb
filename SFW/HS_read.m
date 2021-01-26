function [img1]=HS_read(A1,wavelength1)
    k1=(wavelength1-380)/5 + 1;
    img1=im2double(A1(:,:,k1));
    img1=img1/max(img1(:));
end