% function [pattern] = rect_array(Nxr,Nyr,dolxr,dolyr,theta0,phi0,winid,win,nbits)
%%%%% ************************ %%%%%%%%%%%%%%
% This function computes the 3-D directive gain patterns for a planar array
% This function uses the fft2 to compute its output
%%%%%%%%%************ INPUTS ************ %%%%%%%%%%%%
% Nxr ==> number of along x-aixs; Nyr ==> number of elemnts along y-axis
% dolxr ==> element spacing in x-direction; dolyr ==> element spacing in y-direction Both are in lambda units
% theta0 ==> elevation steering angle in degrees, phi0 ==> azimuth steering angle in degrees
% winid ==> window identifier; winid negative ==> no window ; winid positive ==> use window given by win
% win ==> input window function (2-D window) MUST be of size (Nxr X Nyr)
% nbits is the number of nbits used in phase quantization; nbits negative ==> NO quantization
%%%%%%%% *********** OUTPUTS ************* %%%%%%%%%%%%%
% pattern ==> directive gain pattern
%%%%%%%%%%%%%%%% ************************ %%%%%%%%%%%
[pattern] = rect_array(32, 4, 0.5, 4, -15, 45, -1, -1, -3);
% [pattern] = rect_array(15, 15, 0.5, 0.5, 0, 0, -1, -1, -3);
% [pattern] = rect_array(15, 15, 0.5, 0.5, 20, 30, -1, -1, -3)
% [pattern] = rect_array(15, 15, 0.5, 0.5, 45, 45, 1, 'Hamming', -3)
% [pattern] = rect_array(15, 15, 0.5, 0.5, 10, 20, -1, -1, 3)
% [pattern] = rect_array(15, 15, 1, 0.5, 20, 25, -1, -1, -3)
% [pattern] = rect_array(15, 15, 1.25, 1.25, 0, 0, -1, -1, -3)