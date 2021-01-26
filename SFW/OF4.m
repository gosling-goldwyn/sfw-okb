% N_ROW=480;
% N_COL=752;
N_ROW=601;
N_COL=601;
N_WL=151;
N_RC=N_ROW*N_COL;
a=3; %エリアの範囲

% disp('input')
% tic
% A1=loadNH3('20171117','man1_re',N_ROW,N_COL,N_WL);
% toc
% tic
% A2=loadNH3('20171117','man3_re',N_ROW,N_COL,N_WL);
% toc
% img1=HS_read(A1,700);
% img2=HS_read(A2,700);
disp('calculate')
tic
ofi=zeros(N_ROW,N_COL);
ofj=zeros(N_ROW,N_COL);
ofd=zeros(N_ROW,N_COL);
sum1=zeros(N_ROW,N_COL);
sum2=zeros(N_ROW,N_COL);
rate=-1;
asq=(a+1)^2;
f2=zeros(2*a+1,2*a+1,(N_ROW-a)*(N_COL-a));
for ii=a+1:N_ROW-a
    for jj=a+1:N_COL-a
        img22=img2(ii-a:ii+a,jj-a:jj+a);
        f2(:,:,ii*jj)=img22/(sum(sum(img22),2)/asq);
    end
end
for i=a+1:2*a:N_ROW-a
    for j=a+1:2*a:N_COL-a
        dmin=10000;
        img11=img1(i-a:i+a,j-a:j+a);
        f1=img11/(sum(sum(img11),2)/asq);
        %エリアの作成
        for ii=a+1:N_ROW-a
            for jj=a+1:N_COL-a
                d=sum(sum(abs( f1 - f2(:,:,ii*jj))),2);
                if d < dmin
                    dmin=d; mini=ii; minj=jj; %%mini,minjに転移先を保存
                end
            end
        end     
        %OFの探索
        ofi(i,j)=mini; ofj(i,j)=minj; ofd(i,j)=sqrt((i-mini)^2+(j-minj)^2);
        
        rate2=rate;
        rate=round(((i-1)*N_COL+j)/N_RC*100,2);
        if rate ~= rate2
            fprintf('\n%3.2f%%...',rate);
        else
            fprintf('.');
        end
    end
end
fprintf('\n');
save('ofi.mat','ofi');
save('ofj.mat','ofj');
save('ofd.mat','ofd');
toc