% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2849.101837130759577 ; 2876.765634895040876 ];

%-- Principal point:
cc = [ 593.862132258379802 ; 586.428792055788790 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.508001359189554 ; 5.029965987320460 ; 0.053087710429030 ; 0.006201668555673 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 69.332377181101322 ; 81.359478665523511 ];

%-- Principal point uncertainty:
cc_error = [ 34.560739112587243 ; 89.702182758320021 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.156068186611269 ; 2.554591777569996 ; 0.008316792808002 ; 0.006117834736448 ; 0.000000000000000 ];

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
omc_1 = [ -1.785497e+00 ; -1.800662e+00 ; -8.611406e-01 ];
Tc_1  = [ -3.711483e+00 ; -5.678834e+01 ; 2.775440e+02 ];
omc_error_1 = [ 2.125163e-02 ; 2.644329e-02 ; 2.960772e-02 ];
Tc_error_1  = [ 3.505218e+00 ; 8.609742e+00 ; 7.647589e+00 ];

%-- Image #2:
omc_2 = [ 2.458171e+00 ; 1.391827e+00 ; 6.039761e-02 ];
Tc_2  = [ -5.989125e+01 ; -3.837518e+01 ; 3.465282e+02 ];
omc_error_2 = [ 2.584117e-02 ; 1.488767e-02 ; 4.275622e-02 ];
Tc_error_2  = [ 4.217877e+00 ; 1.086809e+01 ; 9.279526e+00 ];

%-- Image #3:
omc_3 = [ 2.127431e+00 ; 1.713055e+00 ; 1.417833e-01 ];
Tc_3  = [ -2.778926e+01 ; -5.016958e+01 ; 3.290625e+02 ];
omc_error_3 = [ 2.443956e-02 ; 1.526125e-02 ; 3.725525e-02 ];
Tc_error_3  = [ 4.064858e+00 ; 1.025207e+01 ; 8.871530e+00 ];

%-- Image #4:
omc_4 = [ 2.217304e+00 ; 1.918806e+00 ; 6.553882e-02 ];
Tc_4  = [ -4.229725e+01 ; -5.445052e+01 ; 3.715323e+02 ];
omc_error_4 = [ 2.628056e-02 ; 2.315758e-02 ; 5.636964e-02 ];
Tc_error_4  = [ 4.573775e+00 ; 1.159799e+01 ; 1.005472e+01 ];

%-- Image #5:
omc_5 = [ -1.939678e+00 ; -1.903754e+00 ; -6.449460e-01 ];
Tc_5  = [ -2.697464e+01 ; -4.260172e+01 ; 2.910360e+02 ];
omc_error_5 = [ 2.279503e-02 ; 2.366658e-02 ; 2.934429e-02 ];
Tc_error_5  = [ 3.645872e+00 ; 9.095596e+00 ; 7.677974e+00 ];

%-- Image #6:
omc_6 = [ 1.940289e+00 ; 1.617344e+00 ; -6.026873e-01 ];
Tc_6  = [ -5.653102e+01 ; -4.576990e+01 ; 3.655177e+02 ];
omc_error_6 = [ 2.100569e-02 ; 2.088641e-02 ; 3.239360e-02 ];
Tc_error_6  = [ 4.529372e+00 ; 1.148680e+01 ; 8.969474e+00 ];

%-- Image #7:
omc_7 = [ 2.250308e+00 ; 1.879123e+00 ; -1.376185e-01 ];
Tc_7  = [ -1.374869e+01 ; -5.507176e+01 ; 3.490004e+02 ];
omc_error_7 = [ 2.626753e-02 ; 2.114328e-02 ; 4.904279e-02 ];
Tc_error_7  = [ 4.346612e+00 ; 1.084521e+01 ; 8.952554e+00 ];

%-- Image #8:
omc_8 = [ 2.352877e+00 ; 2.063732e+00 ; -4.133297e-01 ];
Tc_8  = [ -2.020600e+01 ; -5.187224e+01 ; 3.131301e+02 ];
omc_error_8 = [ 2.338832e-02 ; 2.560928e-02 ; 5.126719e-02 ];
Tc_error_8  = [ 3.955067e+00 ; 9.761849e+00 ; 7.845897e+00 ];

%-- Image #9:
omc_9 = [ 1.801575e+00 ; 1.926588e+00 ; 2.595331e-01 ];
Tc_9  = [ -2.469870e+01 ; -5.841104e+01 ; 2.938758e+02 ];
omc_error_9 = [ 2.125545e-02 ; 1.502637e-02 ; 3.503375e-02 ];
Tc_error_9  = [ 3.683761e+00 ; 9.167594e+00 ; 8.138610e+00 ];

%-- Image #10:
omc_10 = [ 1.882104e+00 ; 2.016230e+00 ; -4.487509e-01 ];
Tc_10  = [ -4.490787e+01 ; -7.536761e+01 ; 3.657803e+02 ];
omc_error_10 = [ 1.768743e-02 ; 2.206555e-02 ; 3.962594e-02 ];
Tc_error_10  = [ 4.611954e+00 ; 1.144095e+01 ; 9.292936e+00 ];

%-- Image #11:
omc_11 = [ -1.966562e+00 ; -2.031910e+00 ; -5.318614e-01 ];
Tc_11  = [ -3.024471e+01 ; -3.847024e+01 ; 2.944206e+02 ];
omc_error_11 = [ 2.368887e-02 ; 2.466812e-02 ; 3.333622e-02 ];
Tc_error_11  = [ 3.666725e+00 ; 9.197858e+00 ; 7.685448e+00 ];

%-- Image #12:
omc_12 = [ 1.905885e+00 ; 2.118927e+00 ; 1.075923e-01 ];
Tc_12  = [ -4.689593e+01 ; -6.021981e+01 ; 2.961664e+02 ];
omc_error_12 = [ 1.803679e-02 ; 2.018560e-02 ; 4.467802e-02 ];
Tc_error_12  = [ 3.702226e+00 ; 9.256599e+00 ; 8.281983e+00 ];

%-- Image #13:
omc_13 = [ 1.608148e+00 ; 1.328245e+00 ; -9.597120e-01 ];
Tc_13  = [ -3.430464e+01 ; -2.659274e+01 ; 3.145966e+02 ];
omc_error_13 = [ 2.353124e-02 ; 2.232852e-02 ; 2.314121e-02 ];
Tc_error_13  = [ 3.881833e+00 ; 9.842237e+00 ; 7.098945e+00 ];

%-- Image #14:
omc_14 = [ 1.962678e+00 ; 2.047742e+00 ; -2.168127e-01 ];
Tc_14  = [ -3.773883e+01 ; -7.637258e+01 ; 6.200338e+02 ];
omc_error_14 = [ 2.444227e-02 ; 2.567982e-02 ; 5.277732e-02 ];
Tc_error_14  = [ 7.652368e+00 ; 1.932705e+01 ; 1.596285e+01 ];

%-- Image #15:
omc_15 = [ -1.960680e+00 ; -2.220670e+00 ; -2.335859e-01 ];
Tc_15  = [ -1.130558e+02 ; -8.313770e+01 ; 5.940190e+02 ];
omc_error_15 = [ 4.079214e-02 ; 3.278392e-02 ; 9.132394e-02 ];
Tc_error_15  = [ 7.433342e+00 ; 1.850622e+01 ; 1.733219e+01 ];

%-- Image #16:
omc_16 = [ -2.107790e+00 ; -2.200472e+00 ; 5.633494e-01 ];
Tc_16  = [ -4.806975e+01 ; -4.855877e+01 ; 3.370948e+02 ];
omc_error_16 = [ 2.029799e-02 ; 1.339490e-02 ; 5.201882e-02 ];
Tc_error_16  = [ 4.261979e+00 ; 1.062824e+01 ; 8.583000e+00 ];

%-- Image #17:
omc_17 = [ 2.024744e+00 ; 2.133442e+00 ; -3.247849e-01 ];
Tc_17  = [ -9.931378e+00 ; -8.062077e+01 ; 4.531876e+02 ];
omc_error_17 = [ 2.213842e-02 ; 2.522422e-02 ; 4.881839e-02 ];
Tc_error_17  = [ 5.691873e+00 ; 1.409375e+01 ; 1.143074e+01 ];

%-- Image #18:
omc_18 = [ 1.151735e+00 ; 1.975026e+00 ; -5.748177e-01 ];
Tc_18  = [ -6.952512e+01 ; -1.510759e+02 ; 8.718999e+02 ];
omc_error_18 = [ 2.051629e-02 ; 2.283883e-02 ; 3.560421e-02 ];
Tc_error_18  = [ 1.086607e+01 ; 2.726614e+01 ; 2.304323e+01 ];

%-- Image #19:
omc_19 = [ 1.612712e+00 ; 1.161524e+00 ; 5.741787e-01 ];
Tc_19  = [ -8.802731e+01 ; -6.596620e+01 ; 4.107993e+02 ];
omc_error_19 = [ 2.595902e-02 ; 1.226540e-02 ; 2.310132e-02 ];
Tc_error_19  = [ 5.169327e+00 ; 1.289047e+01 ; 1.210524e+01 ];

%-- Image #20:
omc_20 = [ -1.337295e+00 ; -1.901380e+00 ; 1.341554e+00 ];
Tc_20  = [ 1.196464e+01 ; -6.773377e+01 ; 4.724382e+02 ];
omc_error_20 = [ 1.938077e-02 ; 1.747350e-02 ; 3.777850e-02 ];
Tc_error_20  = [ 5.869810e+00 ; 1.474140e+01 ; 1.176017e+01 ];

%-- Image #21:
omc_21 = [ -1.679777e+00 ; -2.124261e+00 ; 1.130839e+00 ];
Tc_21  = [ 2.990278e+01 ; -6.707047e+01 ; 4.904858e+02 ];
omc_error_21 = [ 1.887818e-02 ; 1.377169e-02 ; 4.258667e-02 ];
Tc_error_21  = [ 6.058119e+00 ; 1.526698e+01 ; 1.221917e+01 ];

%-- Image #22:
omc_22 = [ 1.958731e+00 ; 2.044444e+00 ; -3.371935e-01 ];
Tc_22  = [ 3.707781e+01 ; -7.179486e+01 ; 6.280072e+02 ];
omc_error_22 = [ 2.596463e-02 ; 2.398860e-02 ; 4.648997e-02 ];
Tc_error_22  = [ 7.808918e+00 ; 1.953292e+01 ; 1.597034e+01 ];

