folder='20171117/';
file1='man1_re_700nm';
file2='man3_re_700nm';
% 0.009
opticFlow = opticalFlowLK('NoiseThreshold',0.1);
% opticFlow = opticalFlowHS('Smoothness',0.1,'VelocityDifference',100,'MaxIteration',Inf);


for i=1:4
    if i==2 || i==4
        file = ['C:\Users\r_nakashima\Documents\MATLAB\hsitest\',folder,file1,'.pgm'];
    elseif i==3
        file = ['C:\Users\r_nakashima\Documents\MATLAB\hsitest\',folder,file2,'.pgm'];
    end
    if i==1
        gray=double(zeros(480,752));
    else
        gray = im2double(imread(file));
        gray=gray/max(gray(:));
    end
    gray=gray(50:350,275:600); 
    flow = estimateFlow(opticFlow,gray);

    imshow(gray)
    hold on
    plot(flow,'DecimationFactor',[5 5],'ScaleFactor',10)
    hold off
end