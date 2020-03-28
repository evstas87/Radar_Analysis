% Use this program to reproduce Fig. 5.9 of textbook
close all
clear all
LFM_BW = 20;
time = linspace(0,1,3000);
S = zeros(1,3000);
tau = .3;
index = find(time<=tau);
ts = tau / 3000; % 1000 samples per PW
beta = LFM_BW/tau;
S(index) = exp(j*pi*beta*(time(index).^2));
SS = repmat(S,1,5);
figure
timet = linspace(0,5,5*3000);
plot(timet,imag(SS),'linewidth',1.5), grid
ylabel('Up chirp LFM')