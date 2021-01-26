tic
N_ROW=480;
N_COL=752;
N_WL=151;

%%% load data %%%
disp('input')
A1=loadNH3('20171117','man1_re',N_ROW,N_COL,N_WL);
toc
tic
A2=loadNH3('20171117','man3_re',N_ROW,N_COL,N_WL);
toc
img1=HS_read(A1,700);
img2=HS_read(A2,700);

%�I�u�W�F�N�g���쐬���܂��B

htran = vision.GeometricTranslator('Offset',[5 5],'OutputSize','Same as input image');
hbm = vision.BlockMatcher('ReferenceFrameSource','Input port','BlockSize',[35 35]);
hbm.OutputValue = 'Horizontal and vertical components in complex form';
halphablend = vision.AlphaBlender;
% Warning: The vision.GeometricTranslator will be removed in a future release.
% Use the imtranslate function with equivalent functionality instead. 

% 2 �̃C���[�W�̓������v�Z���܂��B

motion = step(hbm,img1,img2);
% 2 �̃C���[�W���u�����h���܂��B

img12 = step(halphablend,img2,img1);
% Quiver �v���b�g���g�p���ăC���[�W�̓����̕����������܂��B

[X,Y] = meshgrid(1:35:size(img1,2),1:35:size(img1,1));
imshow(img12);
hold on;
quiver(X(:),Y(:),real(motion(:)),imag(motion(:)),0);
hold off;