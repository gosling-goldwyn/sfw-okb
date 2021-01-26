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
disp('phase1')
for i=a+1:2*a:N_ROW-a
    for j=a+1:2*a:N_COL-a
%         sum1=0;        
%         %エリアの作成
%         for i2=i-a:i+a
%             for j2=j-a:j+a
%                 sum1=sum1+img1(i2,j2);
%             end
%         end %%sum1に元画像のエリアの合計を格納
        sum1(i,j)=sum(sum(img1(i-a:i+a,j-a:j+a)/(max(max(img1(i-a:i+a,j-a:j+a))))),2);

        rate2=rate;
        rate=round(((i-1)*N_COL+j)/N_RC*100);
        if rate ~= rate2
            disp([int2str(rate) '%... '])
        end
    end
end

rate=-1;
disp('phase2')
        for ii=a+1:N_ROW-a
            for jj=a+1:N_COL-a
%                 sum2=0;
%                 %エリアの作成
%                 for ii2=ii-a:ii+a
%                     for jj2=jj-a:jj+a
%                         sum2=sum2+img2(ii2,jj2);
%                     end
%                 end %%sum2に次フレームのエリアの合計を格納
                sum2(ii,jj)=sum(sum(img2(ii-a:ii+a,jj-a:jj+a)/(max(max(img2(ii-a:ii+a,jj-a:jj+a))))),2);
                
        rate2=rate;
        rate=round(((ii-1)*N_COL+jj)/N_RC*100);
        if rate ~= rate2
            disp([int2str(rate) '%... '])
        end
            end
        end

rate=-1;
disp('phase3')
for i=a+1:2*a:N_ROW-a
    for j=a+1:2*a:N_COL-a
        dmin=10000;
        for ii=a+1:N_ROW-a
            for jj=a+1:N_COL-a
                d=abs(sum1(i,j)-sum2(ii,jj));
                if d < dmin
                    dmin=d; mini=ii; minj=jj; %%mini,minjに転移先を保存
                end
            end
        end
        %OFの探索
        ofi(i,j)=mini; ofj(i,j)=minj; ofd(i,j)=sqrt((i-mini)^2+(j-minj)^2);
        
        rate2=rate;
        rate=round(((i-1)*N_COL+j)/N_RC*100);
        if rate ~= rate2
            disp([int2str(rate) '%... '])
        end
    end
end
        
toc
        