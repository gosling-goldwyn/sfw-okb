%%% load data %%%
function [hs]=loadNH3(folder,name1,N_ROW,N_COL,N_WL)
  fileName_nh3=['\\ushi06/Open Folder/user/r_nakashima/HSI/',folder,'/',name1,'.nh5k'];
  hs=[];
% hs=zeros(N_ROW,N_COL,N_WL);
  fi=fopen(fileName_nh3,'r');
  if (fi<0)
    error('file open error: <%s>',fileName_nh3);
  end
  a=fread(fi,'uint16');
  fclose(fi);
  b=reshape(a,[N_COL, N_WL,N_ROW]);
  hs=permute(b,[3 1 2]);
% a=fread(fi,N_ROW*N_COL*N_WL,'uint16');
% fclose(fi);
% for k=1:N_WL
%     for j =1:N_ROW
%         for i=1:N_COL
%             hs(j,i,k)=a(i+N_COL*N_WL*(j-1)+N_COL*(k-1),1);
%         end
%     end
% end
%%%データ配置：列（横）　波長　行（縦）
end
