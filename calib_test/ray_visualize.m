N_ROW=768;
N_COL=1024;
disp('colorize');
tmp_n=zeros(N_ROW,N_COL,3);
for i=1:N_ROW
    for j=1:N_COL
        nm=sqrt(x_n(i,j,1)^2+x_n(i,j,2)^2+1);
        tmp_n(i,j,1)=x_n(i,j,1)/nm;
        tmp_n(i,j,2)=x_n(i,j,2)/nm;
        tmp_n(i,j,3)=1/nm;
    end
end

%%%âÊëúÇÃê∂ê¨
disp('save');
fp=fopen('visualize.ppm','w');

sncolor=zeros(N_ROW,N_COL,3);
for i=1:N_ROW
  for j=1:N_COL
    for k=1:3
      sncolor(i,j,k)  = (tmp_n(i,j,k)+1)*255/2;
    end
  end
end
sncolor=round(sncolor);

fprintf(fp,'P3\r\n');
fprintf(fp,'1024 768\r\n');
fprintf(fp,'255\r\n');

for i=1:N_ROW
  for j=1:N_COL
    for k=1:3
      fprintf(fp,' %3d',sncolor(i,j,k));
    end
  end
  fprintf(fp, '\r\n');
end
fclose(fp);