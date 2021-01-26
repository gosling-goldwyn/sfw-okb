%�e��fI(i,j)�ɂ��āA
%���܂Ȃ������̌���e1(i,j)��
%���܂���1�����̌���e2(i,j)
%���܂���1�����̌���e3(i,j)
%���܂���2�����̌���e4(i,j)
%���܂���2�����̌���e5(i,j)
%i,j�̈ړ����u1,v1,u2,v2�ŕ\�����ƂŁA
%�����̌�����ray(i,j,1),ray(i,j,2)�ŕ\��
%���܂Ȃ��Ƌ��܂���̊p�xalpha1(i,j),alpha2(i,j)

N_ROW=768;
N_COL=1024;
num=10; %������

alpha1=zeros(N_ROW,N_COL);
alpha2=zeros(N_ROW,N_COL);
r1=zeros(N_ROW,N_COL);
r2=zeros(N_ROW,N_COL);
ray=zeros(N_ROW,N_COL,2);
tic;
disp('load')
%���m���ǂݍ���
%depth:�����̌��H�� @sfw.m�ō쐬
load('depth1.mat');
load('depth2.mat');
%Tinv:�z���O���t�B�s�� @matching.m�ō쐬
load('Tinv.mat');
Tinv1=Tinv;
load('Tinv2.mat');
Tinv2=Tinv;
%x_n:�����̌��� @../calib_test/calib_test.m�ō쐬
load('../calib_test/x_n.mat');
toc;
disp('normalize ray')
%������xz���ʂɐ��K��(�c*�[��),�傫����1
for i=1:N_ROW
    for j=1:N_COL
        ray(i,j,1)=x_n(i,j,2)/sqrt(x_n(i,j,2)^2+1); %��=x��
        ray(i,j,2)=1/sqrt(x_n(i,j,2)^2+1); %�c=y(z)��
    end
end
toc;
disp('calculate moved')
%�e��f�̈ړ���̌v�Z
moved1=trans(N_ROW,N_COL,Tinv1);
moved2=trans(N_ROW,N_COL,Tinv2);
toc;
%%�g�p����̈�I��%%
T=110;B=480;L=330;R=530; %B=480
%Top Bottom Left Right

disp('calculate degrees')
for i= T:B
    for j= L:R
        %�P�ʃx�N�g���̓��ς���p�x(���W�A��)�𓱏o
        %i,j�̈ړ����u,v�Ƃ���
        u1=moved1(i,j,1);
        v1=moved1(i,j,2);
        u2=moved2(i,j,1);
        v2=moved2(i,j,2);
        
        %���f�����o��̂łƂ肠�����������̂�
        alpha1(i,j)=real(acos(ray(i,j,1)*ray(u1,v1,1)+ray(i,j,2)*ray(u1,v1,2)));
        alpha2(i,j)=real(acos(ray(i,j,1)*ray(u2,v2,1)+ray(i,j,2)*ray(u2,v2,2)));
    end
end
toc;
%���m���̏����l�ݒ�
t=zeros(N_ROW,N_COL,num);
t(:,:,1)=depth1*1.5;
theta1=0;
theta2=0;

disp('calculate surface')
for n=1:3 %��������܂�
    disp(['iteration:',int2str(n)]);
    for i=T:B
        disp(['processing line',int2str(i),'/',int2str(B)])
        for j=L:R
            %t,r,r'�ɂ��čœK��
            %i,j�̈ړ����u,v�Ƃ���
            u1=moved1(i,j,1);
            v1=moved1(i,j,2);
            u2=moved2(i,j,1);
            v2=moved2(i,j,2);
            
            %���ܕ����ɂ��ꍇ����
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
                sqrt(abs(depth2(i,j)^2-(t(i,j,n)*sin(alpha2(i,j)))^2))*ray(u2,v2,2)]; %B�͎g�p�ς݂������̂�B2��
            %�����̒������ɂȂ��Ă��܂��̂Ő�Βl������Ă݂�
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