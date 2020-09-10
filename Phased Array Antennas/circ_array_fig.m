% function [pattern,amn] = circ_array(N,dolxr,dolyr,theta0,phi0,winid,win,nbits);
% %%%%%% ************************ %%%%%%%%%%%%%%
% % This function computes the 3-D directive gain patterns for a circular planar array
% % This function uses the fft2 to compute its output. It assumes that there are the same number
% % of elements along the major x- and y-axes
% %%%%%%%%% ************ INPUTS ************ %%%%%%%%%% N ==> number of elements
% along x-aixs or y-axis
% % dolxr ==> element spacing in x-direction; dolyr ==> element spacing in y-direction. Both are in
% lambda units
% % theta0 ==> elevation steering angle in degrees, phi0 ==> azimuth steering angle in degrees
% % This function uses the function (rec_to_circ) which computes the circular array from a square
% % array (of size NXN) using the notation developed by ALLEN,J.L.,"The Theory of Array Antennas
% % (with Emphasis on Radar Application)" MIT-LL Technical Report No. 323,July, 25 1965.
% % winid ==> window identifier; winid negative ==> no window ; winid positive ==> use window given
% by win
% % win ==> input window function (2-D window) MUST be of size (Nxr X Nyr)
% % nbits is the number of nbits used in phase quantization; nbits negative ==> NO quantization
% %%%%%%%%%% *********** OUTPUTS ************* %%%%%%%%
% % amn ==> array of ones and zeros; ones indicates true element location on the grid
% % zeros mean no elements at that location; pattern ==> directive gain pattern
[pattern,amn] = circ_array(11,0.5,0.5,0,0,-1,ones(11,11),-1);