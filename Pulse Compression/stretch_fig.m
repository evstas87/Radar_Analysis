% use this program to reproduce Fig. 7.3 of text
clc
clear all
close all
nscat = 3; %two point scatterers
taup = 10e-3; % 100 milisecond uncompressed pulse
f0 = 5.6e9;
b = 1.0e9; % 1 GHz bandwidth
rrec = 30 ; % 30 meter processing window
scat_range = [2 5 10] ; % scatterers are 15 and 25 meters into window
scat_rcs = [1 1 2]; % RCS 1 m^2 and 2m^2
winid = 2; % kayser


[y] = stretch(nscat, taup, f0, b, scat_range, rrec, scat_rcs, winid);
