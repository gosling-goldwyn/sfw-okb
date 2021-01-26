tic;
disp('input')
N_ROW=480;
N_COL=752;
N_WL=151;
fi='\\ushi06/Open Folder/user/r_nakashima/HSI/20171006/naname1.nh3';

A1=loadNH3(fi,N_ROW,N_COL,N_WL);
toc;
A2=zeros(N_ROW,N_COL,1,N_WL);
A2(:,:,1,:)=A1(:,:,:);

% max1=0;
%       for k=1:N_WL
% for i=1:N_ROW
%   for j=1:N_COL
%     if max1<A2(i,j,1,k)
%       max1=A2(i,j,1,k);
%     end
%   end
% end
%     A2(:,;,1,k)=round(A2(:,:,1,k)/max1*255);
%       end

A2=A2/2500*255;
toc

% for i=130:422
%     for j=[65,637]
%     A2(i,j,1,:)=255;
%     end
% end
% for i=[130,422]
%     for j=65:637
%     A2(i,j,1,:)=255;
%     end
% end

filename='naname1.gif';
imwrite(A2,filename,'gif','DelayTime',0.05);