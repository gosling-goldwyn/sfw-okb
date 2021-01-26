tic
N_ROW=768;
N_COL=1024;
N_WL=125;
N_M=N_ROW*N_COL;

%%% load data %%%
wavelength1=905;
wavelength2=950;
disp('input')
A1=loadNH3('20180520','man2(20f,49.9ms,60g)',N_ROW,N_COL,N_WL);
% A1=loadNH3('20170926','holland02',N_ROW,N_COL,N_WL);

%%使用する領域選択%%
% T=1;B=N_ROW;L=1;R=N_COL;
T=110;B=480;L=330;R=800;%実際に使うのはR=530くらいまで
% T=20;B=400;L=300;R=630;
% T=100;B=425;L=80;R=635;
%Top Bottom Left Right



toc


% I1=im2double(imread('../hsitest/20171115/lena4_905nm.pgm')); %入力画像
% I2=im2double(imread('../hsitest/20171115/lena4_950nm.pgm')); %入力画像
% 
% I1=I1/255;
% I2=I2/255;
I1=HS_read(A1,wavelength1);
I2=HS_read(A1,wavelength2);

I1=I1(T:B,L:R);
I2=I2(T:B,L:R);

I1=I1/max(I1(:));
I2=I2/max(I2(:));

% alpha; %吸収係数グラフ
[a1,a2,a3,A]=ab_co();

l=zeros(B-T+1,R-L+1);
eps=10^-10;
% I1=wiener2(I1,[5 5]);
I2=wiener2(I2,[5 5]);
% gray=uint8(round((I2/max(I2(:)))*255));
% imshow(gray)

for i=1:B-T+1
    for j=1:R-L+1
    l(i,j)=(1/(2*(a2-a1)))*log(I2(i,j)/(I1(i,j)+eps));
    end
end

l=-l;
disp('display');
tic;
% l_sm=l;
l_sm=smoothdata(smoothdata(l,2,'SmoothingFactor',1),'SmoothingFactor',1);

l_sm=smoothdata(l_sm,2,'SmoothingFactor',1);

figure;mesh(l_sm);
toc;
% mesh(l)
% fo=fopen('depth.txt','w');
% for i=1:N_ROW
%   for j=1:N_COL
%     fprintf(fo,' %3d %3d %3f',i,j,l(i,j));
%     fprintf(fo,'\r\n');
%   end
%   fprintf(fo,'\r\n');
% end
% fclose(fo);

depth=zeros(N_ROW,N_COL);
depth(T:B,L:R)=l_sm;