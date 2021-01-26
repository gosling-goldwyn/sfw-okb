% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 662.495218870939084 ; 664.677353483205366 ];

%-- Principal point:
cc = [ 306.512797387931130 ; 241.751069329258542 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.279075493635624 ; 0.320250698878447 ; 0.000504417422673 ; 0.000278224724890 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 1.434001908026257 ; 1.542610097445386 ];

%-- Principal point uncertainty:
cc_error = [ 2.834835119243210 ; 2.608280468170431 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.011436716508122 ; 0.047293445142461 ; 0.000643538653814 ; 0.000669407479430 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.653090e+00 ; 1.646177e+00 ; -6.680986e-01 ];
Tc_1  = [ -6.072623e+02 ; -2.746391e+02 ; 2.860013e+03 ];
omc_error_1 = [ 3.288762e-03 ; 4.270788e-03 ; 5.442504e-03 ];
Tc_error_1  = [ 1.228357e+01 ; 1.134337e+01 ; 6.406000e+00 ];

%-- Image #2:
omc_2 = [ 1.845814e+00 ; 1.894593e+00 ; -3.972575e-01 ];
Tc_2  = [ -5.303212e+02 ; -5.268189e+02 ; 2.543707e+03 ];
omc_error_2 = [ 3.488991e-03 ; 4.285782e-03 ; 6.637215e-03 ];
Tc_error_2  = [ 1.098641e+01 ; 1.008507e+01 ; 6.286063e+00 ];

%-- Image #3:
omc_3 = [ 1.739433e+00 ; 2.071100e+00 ; -5.057412e-01 ];
Tc_3  = [ -4.314214e+02 ; -5.774975e+02 ; 2.603770e+03 ];
omc_error_3 = [ 3.192379e-03 ; 4.538051e-03 ; 6.861768e-03 ];
Tc_error_3  = [ 1.123445e+01 ; 1.032059e+01 ; 6.033451e+00 ];

%-- Image #4:
omc_4 = [ 1.826231e+00 ; 2.110300e+00 ; -1.097720e+00 ];
Tc_4  = [ -2.290349e+02 ; -5.119042e+02 ; 2.614245e+03 ];
omc_error_4 = [ 2.858179e-03 ; 4.661902e-03 ; 6.368369e-03 ];
Tc_error_4  = [ 1.129291e+01 ; 1.029467e+01 ; 4.867758e+00 ];

%-- Image #5:
omc_5 = [ 1.078224e+00 ; 1.917307e+00 ; -2.539014e-01 ];
Tc_5  = [ -3.215668e+02 ; -7.596005e+02 ; 2.474654e+03 ];
omc_error_5 = [ 2.784232e-03 ; 4.349655e-03 ; 4.893740e-03 ];
Tc_error_5  = [ 1.078402e+01 ; 9.830038e+00 ; 5.935460e+00 ];

%-- Image #6:
omc_6 = [ -1.699614e+00 ; -1.931159e+00 ; -7.983278e-01 ];
Tc_6  = [ -5.043950e+02 ; -2.628243e+02 ; 1.494147e+03 ];
omc_error_6 = [ 2.710246e-03 ; 4.357773e-03 ; 5.889267e-03 ];
Tc_error_6  = [ 6.456621e+00 ; 6.068785e+00 ; 5.095235e+00 ];

%-- Image #7:
omc_7 = [ 1.991862e+00 ; 1.931445e+00 ; 1.314183e+00 ];
Tc_7  = [ -2.849588e+02 ; -2.570410e+02 ; 1.484646e+03 ];
omc_error_7 = [ 5.133038e-03 ; 2.638377e-03 ; 6.158798e-03 ];
Tc_error_7  = [ 6.516872e+00 ; 5.958578e+00 ; 5.378063e+00 ];

%-- Image #8:
omc_8 = [ 1.958142e+00 ; 1.824826e+00 ; 1.327690e+00 ];
Tc_8  = [ -5.776989e+02 ; -3.433139e+02 ; 1.559802e+03 ];
omc_error_8 = [ 4.862660e-03 ; 2.676343e-03 ; 5.875220e-03 ];
Tc_error_8  = [ 7.162827e+00 ; 6.488302e+00 ; 6.052794e+00 ];

%-- Image #9:
omc_9 = [ -1.368193e+00 ; -1.987335e+00 ; 3.162262e-01 ];
Tc_9  = [ -1.914500e+01 ; -7.474221e+02 ; 2.451498e+03 ];
omc_error_9 = [ 3.342747e-03 ; 4.284644e-03 ; 5.571554e-03 ];
Tc_error_9  = [ 1.064695e+01 ; 9.687801e+00 ; 6.173083e+00 ];

%-- Image #10:
omc_10 = [ -1.518485e+00 ; -2.092998e+00 ; 1.820969e-01 ];
Tc_10  = [ -1.145212e+02 ; -9.970947e+02 ; 2.891663e+03 ];
omc_error_10 = [ 4.083449e-03 ; 4.883821e-03 ; 7.449956e-03 ];
Tc_error_10  = [ 1.278784e+01 ; 1.150837e+01 ; 8.200081e+00 ];

%-- Image #11:
omc_11 = [ -1.792271e+00 ; -2.066014e+00 ; -4.884753e-01 ];
Tc_11  = [ -5.164095e+02 ; -7.794149e+02 ; 2.364279e+03 ];
omc_error_11 = [ 3.661787e-03 ; 4.600700e-03 ; 7.918884e-03 ];
Tc_error_11  = [ 1.046300e+01 ; 9.842357e+00 ; 8.084020e+00 ];

%-- Image #12:
omc_12 = [ -1.837717e+00 ; -2.088344e+00 ; -5.240871e-01 ];
Tc_12  = [ -4.559242e+02 ; -5.866574e+02 ; 2.029762e+03 ];
omc_error_12 = [ 3.142924e-03 ; 4.448854e-03 ; 7.341375e-03 ];
Tc_error_12  = [ 8.907876e+00 ; 8.313582e+00 ; 6.766098e+00 ];

%-- Image #13:
omc_13 = [ -1.917005e+00 ; -2.117199e+00 ; -6.024020e-01 ];
Tc_13  = [ -4.522071e+02 ; -4.750267e+02 ; 1.828713e+03 ];
omc_error_13 = [ 2.945062e-03 ; 4.413277e-03 ; 7.217785e-03 ];
Tc_error_13  = [ 8.000702e+00 ; 7.444448e+00 ; 6.149046e+00 ];

%-- Image #14:
omc_14 = [ -1.952778e+00 ; -2.125633e+00 ; -5.928973e-01 ];
Tc_14  = [ -4.208509e+02 ; -4.540358e+02 ; 1.648664e+03 ];
omc_error_14 = [ 2.764101e-03 ; 4.306243e-03 ; 7.048373e-03 ];
Tc_error_14  = [ 7.227063e+00 ; 6.710665e+00 ; 5.522074e+00 ];

%-- Image #15:
omc_15 = [ -2.110890e+00 ; -2.256300e+00 ; -4.850656e-01 ];
Tc_15  = [ -6.732628e+02 ; -4.482695e+02 ; 1.617354e+03 ];
omc_error_15 = [ 3.185425e-03 ; 3.969829e-03 ; 7.641973e-03 ];
Tc_error_15  = [ 7.229411e+00 ; 6.740516e+00 ; 5.906498e+00 ];

%-- Image #16:
omc_16 = [ 1.885473e+00 ; 2.332090e+00 ; -1.540361e-01 ];
Tc_16  = [ -6.569802e+01 ; -5.654839e+02 ; 2.337128e+03 ];
omc_error_16 = [ 4.304604e-03 ; 4.538643e-03 ; 9.164031e-03 ];
Tc_error_16  = [ 1.007988e+01 ; 9.178558e+00 ; 7.045401e+00 ];

%-- Image #17:
omc_17 = [ -1.613391e+00 ; -1.956913e+00 ; -3.563791e-01 ];
Tc_17  = [ -4.596271e+02 ; -4.600822e+02 ; 1.644781e+03 ];
omc_error_17 = [ 2.723322e-03 ; 4.144614e-03 ; 5.843452e-03 ];
Tc_error_17  = [ 7.131804e+00 ; 6.653520e+00 ; 4.921361e+00 ];

%-- Image #18:
omc_18 = [ -1.344915e+00 ; -1.706741e+00 ; -3.090758e-01 ];
Tc_18  = [ -6.214219e+02 ; -5.210790e+02 ; 1.496076e+03 ];
omc_error_18 = [ 3.083608e-03 ; 4.041604e-03 ; 4.624837e-03 ];
Tc_error_18  = [ 6.541718e+00 ; 6.123373e+00 ; 4.736444e+00 ];

%-- Image #19:
omc_19 = [ -1.923525e+00 ; -1.840209e+00 ; -1.442396e+00 ];
Tc_19  = [ -3.635457e+02 ; -2.636508e+02 ; 1.131245e+03 ];
omc_error_19 = [ 2.681438e-03 ; 4.684678e-03 ; 5.921617e-03 ];
Tc_error_19  = [ 5.079842e+00 ; 4.678578e+00 ; 4.489765e+00 ];

%-- Image #20:
omc_20 = [ 1.892439e+00 ; 1.593457e+00 ; 1.472738e+00 ];
Tc_20  = [ -4.891760e+02 ; -2.921674e+02 ; 1.339675e+03 ];
omc_error_20 = [ 4.928044e-03 ; 2.736426e-03 ; 5.315916e-03 ];
Tc_error_20  = [ 6.220629e+00 ; 5.562495e+00 ; 5.413679e+00 ];

