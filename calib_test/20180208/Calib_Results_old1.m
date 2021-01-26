% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2872.448581606351127 ; 2901.591670061122841 ];

%-- Principal point:
cc = [ 592.912506937488047 ; 587.993905242462915 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.530780822665268 ; 5.393296129885992 ; 0.053170751418931 ; 0.005256883202423 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 69.510358437341594 ; 81.615327658822082 ];

%-- Principal point uncertainty:
cc_error = [ 33.797640844688317 ; 89.887592226769485 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.162220983207305 ; 2.888363160566021 ; 0.008321713194473 ; 0.006014162287210 ; 0.000000000000000 ];

%-- Image size:
nx = 1024;
ny = 768;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 22;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -1.785405e+00 ; -1.800534e+00 ; -8.621903e-01 ];
Tc_1  = [ -3.598884e+00 ; -5.691215e+01 ; 2.797533e+02 ];
omc_error_1 = [ 2.101791e-02 ; 2.630030e-02 ; 2.944684e-02 ];
Tc_error_1  = [ 3.426453e+00 ; 8.617098e+00 ; 7.669133e+00 ];

%-- Image #2:
omc_2 = [ 2.458692e+00 ; 1.392379e+00 ; 5.842622e-02 ];
Tc_2  = [ -5.978096e+01 ; -3.856011e+01 ; 3.495351e+02 ];
omc_error_2 = [ 2.579902e-02 ; 1.477770e-02 ; 4.188973e-02 ];
Tc_error_2  = [ 4.128325e+00 ; 1.088936e+01 ; 9.306775e+00 ];

%-- Image #3:
omc_3 = [ 2.128019e+00 ; 1.713682e+00 ; 1.405866e-01 ];
Tc_3  = [ -2.767955e+01 ; -5.034623e+01 ; 3.318622e+02 ];
omc_error_3 = [ 2.442135e-02 ; 1.510356e-02 ; 3.675499e-02 ];
Tc_error_3  = [ 3.976813e+00 ; 1.027410e+01 ; 8.901615e+00 ];

%-- Image #4:
omc_4 = [ 2.218185e+00 ; 1.919787e+00 ; 6.364477e-02 ];
Tc_4  = [ -4.217432e+01 ; -5.465123e+01 ; 3.747167e+02 ];
omc_error_4 = [ 2.619128e-02 ; 2.296985e-02 ; 5.562254e-02 ];
Tc_error_4  = [ 4.475452e+00 ; 1.162209e+01 ; 1.008711e+01 ];

%-- Image #5:
omc_5 = [ -1.938759e+00 ; -1.903766e+00 ; -6.425670e-01 ];
Tc_5  = [ -2.687551e+01 ; -4.281988e+01 ; 2.936521e+02 ];
omc_error_5 = [ 2.253171e-02 ; 2.343347e-02 ; 2.919524e-02 ];
Tc_error_5  = [ 3.567970e+00 ; 9.115195e+00 ; 7.702895e+00 ];

%-- Image #6:
omc_6 = [ 1.940184e+00 ; 1.617909e+00 ; -6.041951e-01 ];
Tc_6  = [ -5.638993e+01 ; -4.594209e+01 ; 3.684411e+02 ];
omc_error_6 = [ 2.093703e-02 ; 2.082870e-02 ; 3.171735e-02 ];
Tc_error_6  = [ 4.428396e+00 ; 1.150065e+01 ; 8.996446e+00 ];

%-- Image #7:
omc_7 = [ 2.250434e+00 ; 1.879415e+00 ; -1.409274e-01 ];
Tc_7  = [ -1.362344e+01 ; -5.524047e+01 ; 3.518080e+02 ];
omc_error_7 = [ 2.616096e-02 ; 2.101436e-02 ; 4.808647e-02 ];
Tc_error_7  = [ 4.250080e+00 ; 1.086525e+01 ; 8.969584e+00 ];

%-- Image #8:
omc_8 = [ 2.352041e+00 ; 2.063100e+00 ; -4.159169e-01 ];
Tc_8  = [ -2.008527e+01 ; -5.201417e+01 ; 3.155728e+02 ];
omc_error_8 = [ 2.312170e-02 ; 2.540715e-02 ; 4.978683e-02 ];
Tc_error_8  = [ 3.866141e+00 ; 9.771910e+00 ; 7.869307e+00 ];

%-- Image #9:
omc_9 = [ 1.802113e+00 ; 1.927420e+00 ; 2.588892e-01 ];
Tc_9  = [ -2.459878e+01 ; -5.857247e+01 ; 2.963953e+02 ];
omc_error_9 = [ 2.119887e-02 ; 1.476986e-02 ; 3.474069e-02 ];
Tc_error_9  = [ 3.604519e+00 ; 9.187586e+00 ; 8.170603e+00 ];

%-- Image #10:
omc_10 = [ 1.882026e+00 ; 2.016715e+00 ; -4.512111e-01 ];
Tc_10  = [ -4.476234e+01 ; -7.553138e+01 ; 3.687485e+02 ];
omc_error_10 = [ 1.760855e-02 ; 2.195824e-02 ; 3.887436e-02 ];
Tc_error_10  = [ 4.508857e+00 ; 1.145774e+01 ; 9.321166e+00 ];

%-- Image #11:
omc_11 = [ -1.965989e+00 ; -2.031069e+00 ; -5.325318e-01 ];
Tc_11  = [ -3.014209e+01 ; -3.862246e+01 ; 2.969114e+02 ];
omc_error_11 = [ 2.339492e-02 ; 2.442631e-02 ; 3.310635e-02 ];
Tc_error_11  = [ 3.586606e+00 ; 9.213582e+00 ; 7.707979e+00 ];

%-- Image #12:
omc_12 = [ 1.906804e+00 ; 2.120385e+00 ; 1.054696e-01 ];
Tc_12  = [ -4.680065e+01 ; -6.038037e+01 ; 2.987621e+02 ];
omc_error_12 = [ 1.774494e-02 ; 1.968236e-02 ; 4.448441e-02 ];
Tc_error_12  = [ 3.626691e+00 ; 9.275523e+00 ; 8.318617e+00 ];

%-- Image #13:
omc_13 = [ 1.608303e+00 ; 1.329345e+00 ; -9.612988e-01 ];
Tc_13  = [ -3.419282e+01 ; -2.676698e+01 ; 3.173985e+02 ];
omc_error_13 = [ 2.336787e-02 ; 2.223909e-02 ; 2.265096e-02 ];
Tc_error_13  = [ 3.799535e+00 ; 9.863397e+00 ; 7.132082e+00 ];

%-- Image #14:
omc_14 = [ 1.963014e+00 ; 2.048376e+00 ; -2.183748e-01 ];
Tc_14  = [ -3.752342e+01 ; -7.669331e+01 ; 6.251389e+02 ];
omc_error_14 = [ 2.429773e-02 ; 2.547838e-02 ; 5.178390e-02 ];
Tc_error_14  = [ 7.484702e+00 ; 1.936078e+01 ; 1.600550e+01 ];

%-- Image #15:
omc_15 = [ -1.961672e+00 ; -2.221202e+00 ; -2.317220e-01 ];
Tc_15  = [ -1.129016e+02 ; -8.348305e+01 ; 5.994493e+02 ];
omc_error_15 = [ 4.081585e-02 ; 3.296801e-02 ; 9.154363e-02 ];
Tc_error_15  = [ 7.305608e+00 ; 1.853082e+01 ; 1.744364e+01 ];

%-- Image #16:
omc_16 = [ -2.107098e+00 ; -2.200050e+00 ; 5.651577e-01 ];
Tc_16  = [ -4.793747e+01 ; -4.872192e+01 ; 3.398212e+02 ];
omc_error_16 = [ 2.019717e-02 ; 1.322417e-02 ; 5.103450e-02 ];
Tc_error_16  = [ 4.168350e+00 ; 1.064020e+01 ; 8.613956e+00 ];

%-- Image #17:
omc_17 = [ 2.022326e+00 ; 2.130933e+00 ; -3.302707e-01 ];
Tc_17  = [ -9.776914e+00 ; -8.080317e+01 ; 4.563371e+02 ];
omc_error_17 = [ 2.190617e-02 ; 2.490806e-02 ; 4.744925e-02 ];
Tc_error_17  = [ 5.558904e+00 ; 1.410346e+01 ; 1.144144e+01 ];

%-- Image #18:
omc_18 = [ 1.151331e+00 ; 1.975630e+00 ; -5.761196e-01 ];
Tc_18  = [ -6.921097e+01 ; -1.515280e+02 ; 8.791576e+02 ];
omc_error_18 = [ 2.036001e-02 ; 2.259909e-02 ; 3.507049e-02 ];
Tc_error_18  = [ 1.062919e+01 ; 2.732110e+01 ; 2.309542e+01 ];

%-- Image #19:
omc_19 = [ 1.613497e+00 ; 1.165941e+00 ; 5.773379e-01 ];
Tc_19  = [ -8.395599e+01 ; -5.822184e+01 ; 4.125193e+02 ];
omc_error_19 = [ 2.579830e-02 ; 1.214825e-02 ; 2.320035e-02 ];
Tc_error_19  = [ 5.027538e+00 ; 1.286554e+01 ; 1.201219e+01 ];

%-- Image #20:
omc_20 = [ -1.337106e+00 ; -1.901318e+00 ; 1.342191e+00 ];
Tc_20  = [ 1.213369e+01 ; -6.795062e+01 ; 4.759750e+02 ];
omc_error_20 = [ 1.917978e-02 ; 1.716631e-02 ; 3.734968e-02 ];
Tc_error_20  = [ 5.735552e+00 ; 1.475361e+01 ; 1.180095e+01 ];

%-- Image #21:
omc_21 = [ -1.680152e+00 ; -2.124741e+00 ; 1.131834e+00 ];
Tc_21  = [ 3.006030e+01 ; -6.728104e+01 ; 4.939967e+02 ];
omc_error_21 = [ 1.866006e-02 ; 1.343857e-02 ; 4.197586e-02 ];
Tc_error_21  = [ 5.917707e+00 ; 1.527776e+01 ; 1.224690e+01 ];

%-- Image #22:
omc_22 = [ 1.958490e+00 ; 2.044232e+00 ; -3.398703e-01 ];
Tc_22  = [ 3.728214e+01 ; -7.208389e+01 ; 6.326605e+02 ];
omc_error_22 = [ 2.582906e-02 ; 2.384424e-02 ; 4.556686e-02 ];
Tc_error_22  = [ 7.630454e+00 ; 1.956343e+01 ; 1.597738e+01 ];

