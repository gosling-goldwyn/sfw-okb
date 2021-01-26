N_ROW=768;
N_COL=1024;
x_n=zeros(N_ROW,N_COL,2);
x_n1=zeros(N_ROW,N_COL);
x_n2=zeros(N_ROW,N_COL);

for i=1:N_ROW
    for j=1:N_COL
        x_n(i,j,:)=normalize([i-1;j-1],fc,cc,kc,alpha_c);
    end
end