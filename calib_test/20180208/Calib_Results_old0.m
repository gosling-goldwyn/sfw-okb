% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2912.264930039749743 ; 2970.247703029988770 ];

%-- Principal point:
cc = [ 624.864493595947124 ; 626.433926709425236 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.600446821823775 ; 5.504361463584723 ; 0.048140019580959 ; 0.003452725884341 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 72.962037337672626 ; 90.601599814132044 ];

%-- Principal point uncertainty:
cc_error = [ 37.064349398098273 ; 100.536337238988182 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.177853741638769 ; 2.977108559512689 ; 0.010414946005304 ; 0.006433548507429 ; 0.000000000000000 ];

%-- Image size:
nx = 1024;
ny = 768;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 13;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -1.769762e+00 ; -1.791156e+00 ; -8.858147e-01 ];
Tc_1  = [ -6.806175e+00 ; -6.013597e+01 ; 2.826542e+02 ];
omc_error_1 = [ 2.277162e-02 ; 2.719840e-02 ; 3.280327e-02 ];
Tc_error_1  = [ 3.747056e+00 ; 9.524105e+00 ; 7.994430e+00 ];

%-- Image #2:
omc_2 = [ 2.450473e+00 ; 1.382633e+00 ; 5.893789e-02 ];
Tc_2  = [ -6.379113e+01 ; -4.299096e+01 ; 3.535419e+02 ];
omc_error_2 = [ 2.565911e-02 ; 1.462556e-02 ; 4.384268e-02 ];
Tc_error_2  = [ 4.529700e+00 ; 1.202913e+01 ; 9.834711e+00 ];

%-- Image #3:
omc_3 = [ 2.127873e+00 ; 1.706968e+00 ; 1.410861e-01 ];
Tc_3  = [ -3.154680e+01 ; -5.455557e+01 ; 3.366574e+02 ];
omc_error_3 = [ 2.483272e-02 ; 1.515261e-02 ; 4.049737e-02 ];
Tc_error_3  = [ 4.376074e+00 ; 1.138307e+01 ; 9.484132e+00 ];

%-- Image #4:
omc_4 = [ 2.209349e+00 ; 1.907716e+00 ; 4.915632e-02 ];
Tc_4  = [ -4.652998e+01 ; -5.939343e+01 ; 3.799071e+02 ];
omc_error_4 = [ 2.505530e-02 ; 2.223193e-02 ; 5.700650e-02 ];
Tc_error_4  = [ 4.919602e+00 ; 1.286761e+01 ; 1.065783e+01 ];

%-- Image #5:
omc_5 = [ -1.922200e+00 ; -1.892105e+00 ; -6.704065e-01 ];
Tc_5  = [ -3.021518e+01 ; -4.633639e+01 ; 2.965768e+02 ];
omc_error_5 = [ 2.460359e-02 ; 2.443319e-02 ; 3.182648e-02 ];
Tc_error_5  = [ 3.900858e+00 ; 1.007240e+01 ; 7.989176e+00 ];

%-- Image #6:
omc_6 = [ 1.942028e+00 ; 1.613106e+00 ; -5.881747e-01 ];
Tc_6  = [ -6.053321e+01 ; -5.047636e+01 ; 3.718508e+02 ];
omc_error_6 = [ 2.223060e-02 ; 2.128829e-02 ; 3.517892e-02 ];
Tc_error_6  = [ 4.831135e+00 ; 1.267619e+01 ; 9.478139e+00 ];

%-- Image #7:
omc_7 = [ 2.240337e+00 ; 1.867123e+00 ; -1.396786e-01 ];
Tc_7  = [ -1.761188e+01 ; -5.951948e+01 ; 3.559754e+02 ];
omc_error_7 = [ 2.686781e-02 ; 2.148354e-02 ; 5.042173e-02 ];
Tc_error_7  = [ 4.654624e+00 ; 1.201220e+01 ; 9.402774e+00 ];

%-- Image #8:
omc_8 = [ 2.339535e+00 ; 2.050040e+00 ; -3.814232e-01 ];
Tc_8  = [ -2.373872e+01 ; -5.597236e+01 ; 3.196410e+02 ];
omc_error_8 = [ 2.507647e-02 ; 2.712430e-02 ; 5.419100e-02 ];
Tc_error_8  = [ 4.239650e+00 ; 1.082037e+01 ; 8.328105e+00 ];

%-- Image #9:
omc_9 = [ 1.806203e+00 ; 1.923600e+00 ; 2.600298e-01 ];
Tc_9  = [ -2.814955e+01 ; -6.239981e+01 ; 3.013067e+02 ];
omc_error_9 = [ 2.151741e-02 ; 1.474495e-02 ; 3.845439e-02 ];
Tc_error_9  = [ 3.978804e+00 ; 1.020068e+01 ; 8.820129e+00 ];

%-- Image #10:
omc_10 = [ 1.879315e+00 ; 2.006840e+00 ; -4.427122e-01 ];
Tc_10  = [ -4.896795e+01 ; -7.982296e+01 ; 3.726238e+02 ];
omc_error_10 = [ 1.816052e-02 ; 2.203364e-02 ; 4.251448e-02 ];
Tc_error_10  = [ 4.923217e+00 ; 1.263342e+01 ; 9.844482e+00 ];

%-- Image #11:
omc_11 = [ -1.948212e+00 ; -2.017972e+00 ; -5.619101e-01 ];
Tc_11  = [ -3.350329e+01 ; -4.227088e+01 ; 2.997927e+02 ];
omc_error_11 = [ 2.548134e-02 ; 2.554182e-02 ; 3.569937e-02 ];
Tc_error_11  = [ 3.917715e+00 ; 1.017487e+01 ; 7.992564e+00 ];

%-- Image #12:
omc_12 = [ 1.907193e+00 ; 2.115379e+00 ; 8.526071e-02 ];
Tc_12  = [ -5.043842e+01 ; -6.416336e+01 ; 3.035208e+02 ];
omc_error_12 = [ 1.646391e-02 ; 1.881188e-02 ; 4.747881e-02 ];
Tc_error_12  = [ 3.997666e+00 ; 1.026883e+01 ; 8.956635e+00 ];

%-- Image #13:
omc_13 = [ 1.617367e+00 ; 1.328587e+00 ; -9.445532e-01 ];
Tc_13  = [ -3.775158e+01 ; -3.074773e+01 ; 3.202759e+02 ];
omc_error_13 = [ 2.569758e-02 ; 2.308876e-02 ; 2.578019e-02 ];
Tc_error_13  = [ 4.148948e+00 ; 1.088109e+01 ; 7.422851e+00 ];

