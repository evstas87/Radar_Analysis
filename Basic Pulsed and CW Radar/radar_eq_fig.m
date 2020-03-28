% Use this program to reproduce Fig. 2.1 of text.
clc
close all
clear all
pt    = 500 * 2000; % peak power in Watts
freq  = 3.1e9; % radar operating frequency in Hz
g     = 10*log10(4*pi*3*2/0.09^2); % antenna gain in dB
sigma = 1; % radar cross section in m squared
b     = 5.0e+6; % radar operating bandwidth in Hz
nf    = 4.0; %noise figure in dB
loss  = 7.0; % radar losses in dB
range = linspace(25e3,300e3,5000); % range to target from 25 Km 165 Km, 1000 points
snr1 = radar_eq(pt, freq, g, sigma/10, b, nf, loss, range);
snr2 = radar_eq(pt, freq, g, sigma, b, nf, loss, range);
snr3 = radar_eq(pt, freq, g, sigma*10, b, nf, loss, range);
% plot SNR versus range
figure(1)
rangekm = range ./ 1000;
plot(rangekm,snr1,'k',rangekm,snr2,'k -.',rangekm,snr3,'k:','linewidth',1.5)
grid
legend('\sigma = -10 dBsm','\sigma = 0 dBsm','\sigma = 10 dBsm')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');
snr1 = radar_eq(pt*0.5, freq, g, sigma, b, nf, loss, range);
snr2 = radar_eq(pt*1, freq, g, sigma, b, nf, loss, range);
snr3 = radar_eq(pt*2, freq, g, sigma, b, nf, loss, range);
figure (2)
plot(rangekm,snr1,'k',rangekm,snr2,'k -.',rangekm,snr3,'k:','linewidth',1.5)
grid
legend('Pt = 0.5 MW','Pt = 1 MW','Pt = 2 MW')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');