%%% …‚Ì‹zûŒW”‚ğæ‚èo‚·
%%% Ql:http://omlc.ogi.edu/spectra/water/abs/index.html
%%% kou93:http://omlc.ogi.edu/spectra/water/data/kou93b.dat
%%% segelstein81:http://omlc.ogi.edu/spectra/water/data/segelstein81.dat

function [ab_co1,ab_co2,ab_co3,A] = ab_co(~)
    fi=fopen('kou93b.dat','r');
%     fi=fopen('segelstein81.dat','r');
    if (fi<0)
        error('file open error: <%s>',fileName_nh3);
    end
    
    for i=1:5
        fgets(fi);
    end
    A=fscanf(fi,'%d %f',[2 Inf]);
    A=A';
    fclose(fi);
    %%% cm^-1 -> mm^-1
    A(:,2)=0.1*A(:,2);
%     x=A(131:291,1);
%     y=A(131:291,2);
%     plot(x,y);
ab_co1=A(353,2);
ab_co2=A(327,2);
ab_co3=A(301,2);
end