%各画素I(i,j)について、
%屈折なし光線の向きe1(i,j)と
%屈折あり1光線の向きe2(i,j)
%屈折あり1水中の向きe3(i,j)
%屈折あり2光線の向きe4(i,j)
%屈折あり2水中の向きe5(i,j)
%i,jの移動先をu1,v1,u2,v2で表すことで、
%光線の向きをray(i,j,1),ray(i,j,2)で表す
%屈折なしと屈折ありの角度alpha1(i,j),alpha2(i,j)

N_ROW=768;
N_COL=1024;
num=10; %反復回数

alpha1=zeros(N_ROW,N_COL);
alpha2=zeros(N_ROW,N_COL);
r1=zeros(N_ROW,N_COL);
r2=zeros(N_ROW,N_COL);
ray=zeros(N_ROW,N_COL,2);
tic;
disp('load')
%既知数読み込み
%depth:水中の光路長 @sfw.mで作成
load('depth1.mat');
load('depth2.mat');
%Tinv:ホモグラフィ行列 @matching.mで作成
load('Tinv.mat');
Tinv1=Tinv;
load('Tinv2.mat');
Tinv2=Tinv;
%x_n:光線の向き @../calib_test/calib_test.mで作成
load('../calib_test/x_n.mat');
toc;
disp('normalize ray')
%光線をxz平面に正規化(縦*深さ),大きさが1
for i=1:N_ROW
    for j=1:N_COL
        ray(i,j,1)=x_n(i,j,2)/sqrt(x_n(i,j,2)^2+1); %横=x軸
        ray(i,j,2)=1/sqrt(x_n(i,j,2)^2+1); %縦=y(z)軸
    end
end
toc;
disp('calculate moved')
%各画素の移動先の計算
moved1=trans(N_ROW,N_COL,Tinv1);
moved2=trans(N_ROW,N_COL,Tinv2);
toc;
%%使用する領域選択%%
T=110;B=480;L=330;R=530; %B=480
%Top Bottom Left Right

disp('calculate degrees')
for i= T:B
    for j= L:R
        %単位ベクトルの内積から角度(ラジアン)を導出
        %i,jの移動先をu,vとする
        u1=moved1(i,j,1);
        v1=moved1(i,j,2);
        u2=moved2(i,j,1);
        v2=moved2(i,j,2);
        
        %複素数が出るのでとりあえず実数部のみ
        alpha1(i,j)=real(acos(ray(i,j,1)*ray(u1,v1,1)+ray(i,j,2)*ray(u1,v1,2)));
        alpha2(i,j)=real(acos(ray(i,j,1)*ray(u2,v2,1)+ray(i,j,2)*ray(u2,v2,2)));
    end
end
toc;
%未知数の初期値設定
t=zeros(N_ROW,N_COL,num);
t(:,:,1)=depth1*1.5;
theta1=0;
theta2=0;

disp('calculate surface')
for n=1:3 %収束するまで
    disp(['iteration:',int2str(n)]);
    for i=T:B
        disp(['processing line',int2str(i),'/',int2str(B)])
        for j=L:R
            %t,r,r'について最適化
            %i,jの移動先をu,vとする
            u1=moved1(i,j,1);
            v1=moved1(i,j,2);
            u2=moved2(i,j,1);
            v2=moved2(i,j,2);
            
            %屈折方向による場合分け
            if i >= u1 && i >=u2
                A=[ray(i,j,1)-sin(alpha1(i,j))*ray(u1,v1,2), -ray(u1,v1,1), 0;...
                    ray(i,j,2)+sin(alpha1(i,j))*ray(u1,v1,1), ray(u1,v1,2), 0;...
                    ray(i,j,1)-sin(alpha2(i,j))*ray(u2,v2,2), 0, -ray(u2,v2,1);...
                    ray(i,j,2)+sin(alpha2(i,j))*ray(u2,v2,1), 0, ray(u2,v2,2)];
            elseif i<u1 && i>=u2
                A=[ray(i,j,1)+sin(alpha1(i,j))*ray(u1,v1,2), -ray(u1,v1,1), 0;...
                    ray(i,j,2)-sin(alpha1(i,j))*ray(u1,v1,1), ray(u1,v1,2), 0;...
                    ray(i,j,1)-sin(alpha2(i,j))*ray(u2,v2,2), 0, -ray(u2,v2,1);...
                    ray(i,j,2)+sin(alpha2(i,j))*ray(u2,v2,1), 0, ray(u2,v2,2)];
            elseif i>=u1 && i<u2
                A=[ray(i,j,1)-sin(alpha1(i,j))*ray(u1,v1,2), -ray(u1,v1,1), 0;...
                    ray(i,j,2)+sin(alpha1(i,j))*ray(u1,v1,1), ray(u1,v1,2), 0;...
                    ray(i,j,1)+sin(alpha2(i,j))*ray(u2,v2,2), 0, -ray(u2,v2,1);...
                    ray(i,j,2)-sin(alpha2(i,j))*ray(u2,v2,1), 0, ray(u2,v2,2)];
            else
                A=[ray(i,j,1)+sin(alpha1(i,j))*ray(u1,v1,2), -ray(u1,v1,1), 0;...
                    ray(i,j,2)-sin(alpha1(i,j))*ray(u1,v1,1), ray(u1,v1,2), 0;...
                    ray(i,j,1)+sin(alpha2(i,j))*ray(u2,v2,2), 0, -ray(u2,v2,1);...
                    ray(i,j,2)-sin(alpha2(i,j))*ray(u2,v2,1), 0, ray(u2,v2,2)];
            end
            B2=[sqrt(abs(depth1(i,j)^2-(t(i,j,n)*sin(alpha1(i,j)))^2))*ray(u1,v1,1);...
                sqrt(abs(depth1(i,j)^2-(t(i,j,n)*sin(alpha1(i,j)))^2))*ray(u1,v1,2);...
                sqrt(abs(depth2(i,j)^2-(t(i,j,n)*sin(alpha2(i,j)))^2))*ray(u2,v2,1);...
                sqrt(abs(depth2(i,j)^2-(t(i,j,n)*sin(alpha2(i,j)))^2))*ray(u2,v2,2)]; %Bは使用済みだったのでB2に
            %根号の中が負になってしまうので絶対値を取ってみる
            C=[sin(alpha1(i,j))/depth1(i,j), 0, 0;...
                sin(alpha2(i,j))/depth2(i,j), 0, 0;...
                -sin(alpha1(i,j))/depth1(i,j), 0, 0;...
                -sin(alpha2(i,j))/depth2(i,j), 0, 0;...
                1, -1,0;...
                1, 0, -1;...
                -1,1,0;...
                -1,0,1];
            D=[1;1;0;0;depth1(i,j);depth2(i,j);0;0];
            
            tmp=lsqlin(A,B2,C,D,[],[],[0;0;0],Inf*ones(3,1),[t(i,j,n);depth1(i,j);depth2(i,j)],optimoptions(@lsqlin,'MaxIterations',1000));
            t(i,j,n+1)=tmp(1);r1(i,j)=tmp(2);r2(i,j)=tmp(3);
            
            %deg_sur=(t(i,j,num+1)/depth1(i,j))*sin(alpha1(i,j));
        end
    end
    toc;
end