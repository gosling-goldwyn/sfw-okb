%     in1=imread('../SR/elleSR_0.2/input/im2/googlelogo2.pgm');
%     in2=imread('../SR/elleSR_0.2/input/HS_LRC8.pgm');
%     
%     pts=detectSURFFeatures(in1);
%     figure; imshow(in1); hold on;
%     plot(pts);

N_ROW=200;
N_COL=300;
for m=11:11
    display(['save ',int2str(m)]);
% in1=imread('../hsitest/marker_upper_left.png');
in1=imread('../hsitest/marker2.pgm');
    if m<10
in2=imread(['../hsitest/output/lr0',int2str(m),'.pgm']);
    else
        in2=imread(['../hsitest/output/lr',int2str(m),'.pgm']);
    end


pts1 = detectSURFFeatures(in1,'NumScaleLevels',6,'NumOctaves',1);
pts2 = detectSURFFeatures(in2,'NumScaleLevels',6,'NumOctaves',1);

%特徴記述子の抽出
    [features1, validPts1]  = extractFeatures(in1,  pts1);
    [features2, validPts2]  = extractFeatures(in2, pts2);
    %特徴の一致
    indexPairs = matchFeatures(features1, features2);
    %対応点の取得
    matched1  = validPts1(indexPairs(:,1));
    matched2 = validPts2(indexPairs(:,2));
    stg=selectStrongest(matched2,1);
%       figure;
%       showMatchedFeatures(in1,in2,matched1,matched2,'montage');
     

     ml=round(stg.Location)-[50,50];
     if ml(1) < 10
        ml(1)=10;
     end
     if ml(2) < 10
         ml(2) = 10;
     end
     
     cut=zeros(N_ROW,N_COL);
     for i=1:N_ROW
         for j=1:N_COL
             cut(i,j)=in2(ml(2)+i,ml(1)+j);
         end
     end
     
     cut=round(cut/65535*255);
     
     %%% save data %%%
    if m<10
fo=fopen(['../hsitest/cut/cut0',int2str(m),'.pgm'],'w');
    else
        fo=fopen(['../hsitest/cut/cut',int2str(m),'.pgm'],'w');
    end
fprintf(fo,'P2\n%d %d\n255\n',N_COL,N_ROW);
for i=1:N_ROW
  for j=1:N_COL
      if cut(i,j)>255
          cut(i,j)=255;
      end
    fprintf(fo,' %3d',cut(i,j));
  end
  fprintf(fo,'\n');
end
fclose(fo);
 end
      