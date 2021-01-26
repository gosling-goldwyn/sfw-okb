function wrtimg(path,img)
[N_ROW,N_COL,N_Z]=size(img);

 fo=fopen(path,'w');
 if N_Z==1
     fprintf(fo,'P2\n%d %d\n255\n',N_COL,N_ROW);
 elseif N_Z==3
     fprintf(fo,'P3\n%d %d\n255\n',N_COL,N_ROW);
 else
    error('pgm‚©ppm‚Ì‚İ‘Î‰');
 end
 
    for i=1:N_ROW
        for j=1:N_COL
            for k=1:N_Z
            if img(i,j,k)>255
                img(i,j,k)=255;
            elseif img(i,j,k)<0
                img(i,j,k)=0;
            end
            fprintf(fo,' %3d',img(i,j,k));
            end
        end
        fprintf(fo,'\n');
    end
 fclose(fo);
end