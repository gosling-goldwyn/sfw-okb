t=struct([]);
t2=struct([]);
tic
N_ROW=768;
N_COL=1024;
N_WL=125;

%%% load data %%%
disp('input')
% A1=loadNH3('20180520','man1(20f,49.9ms,60g)',N_ROW,N_COL,N_WL);
% toc
% tic
% A2=loadNH3('20180520','man2(20f,49.9ms,60g)',N_ROW,N_COL,N_WL);
% toc
% in1=HS_read(A1,500);
% in2=9*HS_read(A2,500);

% in1=im2double(rgb2gray(imread('../hsitest/20171117/IMG_8072.JPG'))); %入力画像
% in2=im2double(rgb2gray(imread('../hsitest/20171117/IMG_8071.JPG'))); %入力画像
% in1=rot90(in1,3);
% in2=rot90(in2,3);
% in1=in1(790:1390,850:1450);
% in2=in2(790:1390,850:1450);
% img1=in1;img2=in2;

% im1t=rgb2gray(im2double(imread('img/IMG_0017.JPG')));
% in1=imresize(im1t,0.5);
% im2t=rgb2gray(im2double(imread('img/IMG_0018.JPG')));
% in2=imresize(im2t,0.5);

[N_ROW,N_COL]=size(in1);
in1=im2double(imread('../hsitest/20180520/man1(20f,49.9ms,60g)_ave.pgm')); %入力画像
in2=im2double(imread('../hsitest/20180520/man3(20f,49.9ms,60g)_ave.pgm')); %入力画像
    %特徴検出
    %'BRISK', 'FAST', 'Harris', 'MinEigen', 'MSER', or 'SURF'
     pts1 = detectSURFFeatures(in1,'NumScaleLevels',6,'NumOctaves',1);
     pts2 = detectSURFFeatures(in2,'NumScaleLevels',6,'NumOctaves',1);
% imshow(in1); hold on; 
% plot(pts1.selectStrongest(20));
% hold off;
% 
% imshow(in2); hold on; 
% plot(pts2.selectStrongest(10));
% hold off;
%特徴記述子の抽出
[features1, validPts1]  = extractFeatures(in1,  pts1);
    [features2, validPts2]  = extractFeatures(in2, pts2);
    %特徴の一致
    indexPairs = matchFeatures(features1, features2);
    %対応点の取得
    matched1  = validPts1(indexPairs(:,1));
    matched2 = validPts2(indexPairs(:,2));
%      figure;
%      showMatchedFeatures(in1,in2,matched1,matched2);
    
         %変換の推定
    [tform, inlierPts2, inlierPts1] = estimateGeometricTransform(matched2, matched1, 'projective','MaxDistance',3.0); %%'similarity' , 'affine', or 'projective'
     figure;
     showMatchedFeatures(in1,in2, inlierPts1, inlierPts2);

       outputView = imref2d(size(in1));
       rate=-1;

       recovered  = imwarp(in2,tform,'OutputView',outputView);
% recovered=imwarp(in2,tform);
     figure, imshowpair(in1,recovered,'falsecolor');
    figure,imshow(recovered);


recovered=zeros(size(in1));
distance=zeros(size(in1));
distancex=zeros(size(in1));
distancey=zeros(size(in1));
outputView = imref2d(size(in1));
Tinv=inv(tform.T);
for i=1:N_ROW
    for j=1:N_COL
%         [x,y]=intrinsicToWorld(outputView,j,i);
        x=j+0.5;y=i+0.5; %固有座標に変換
        [x2,y2]=intrinsicToWorld(outputView,x,y); %世界座標に変換
       R=[x2,y2,1]*Tinv;
       [u,v]=worldToIntrinsic(outputView,R(1,1)/R(1,3),R(1,2)/R(1,3)); %移動後の世界座標を固有座標に変換
       u2=round(u-0.5);
       v2=round(v-0.5);
if u2>0&&u2<N_COL&&v2>0&&v2<N_ROW
        recovered(i,j)=in2(v2,u2);
end
        %distance:移動先が何ピクセル分離れているか計算
        distance(i,j)=sqrt((v2-i)^2+(u2-j)^2);
        %distancex:移動先がy軸方向=縦iに何ピクセル離れているか
        distancey(i,j)=abs(v2-i);
        %distancey:移動先がx軸方向=横jに何ピクセル離れているか
        distancex(i,j)=abs(u2-j);
                rate2=rate;
                rate=round(((i-1)*N_COL+j)/(N_ROW*N_COL)*100,2);
        if rate ~= rate2
            fprintf('\n%3.2f%%...',rate);
        else
            fprintf('.');
        end
    end
end
fprintf('\n');
% distance=round(distance/max(distance(:))*255);
figure,subplot(2,2,1), imshow(in1);
subplot(2,2,2), imshow(in2);
subplot(2,2,3), imshow(recovered);
subplot(2,2,4), imshowpair(in1,recovered,'falsecolor');
% figure,imshow(uint8(distance));
figure,imagesc(distance),colorbar;