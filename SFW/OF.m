tic
N_ROW=480;
N_COL=752;
N_WL=151;

%%% load data %%%
disp('input')
% A1=loadNH3('20171117','man1_re',N_ROW,N_COL,N_WL);
% toc
% tic
% A2=loadNH3('20171117','man3_re',N_ROW,N_COL,N_WL);
% toc
% % img1=HS_read(A1,700);
% % img2=HS_read(A2,700);

% 0.009
% opticFlow = opticalFlowLK('NoiseThreshold',0.01);
opticFlow = opticalFlowHS('Smoothness',2);

img1=rgb2gray(im2double(imread('img/IMG_0017.JPG')));
img2=rgb2gray(im2double(imread('img/IMG_0018.JPG')));
[N_ROW,N_COL]=size(img1);

for i=1:4
    if i==1
        gray=double(zeros(N_ROW,N_COL));
    elseif i==2 || i==4
        gray=img1;
    else
        gray=img2;
    end
    gray=gray/max(gray(:));
%     gray=gray(50:350,275:600); 
    flow = estimateFlow(opticFlow,gray);

    imshow(gray)
    hold on
    plot(flow,'DecimationFactor',[5 5],'ScaleFactor',50)
    hold off
end