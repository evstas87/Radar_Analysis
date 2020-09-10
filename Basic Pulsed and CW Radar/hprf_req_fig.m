% Use this program to reproduce Fig. 2.3 of text.
clc
close all
clear all
pt = 1000*300; % peak power in Watts
freq = 3.1e+9; % radar operating frequency in Hz
gt = 37; %10*log10(4*pi*2*3/(0.1^2));
gr = 35; %10*log10(4*pi*1.5*2/(0.1^2));

sigma = 0.1; % radar cross section in m squared
nf = 3.5; %noise figure in dB
loss = 6.75; % radar losses in dB
Ti = 10e-3; % time on target in seconds
dt  = .1; % 10% duty cycle 
% Energy = pt * Ti * dt; SNR = Pav + Tot + Gt + Gr + 2*Lambda + Sigma...
%   - (3*dB(4*pi) + 4*R + KT + Loss + NoiseFifure)

range = linspace(10e3,225e3,1000); % range to target from 10 Km 225 Km, 1000 points
snr1 = hprf_req (pt, Ti, gt, gr, freq, sigma, dt, range, nf, loss);
snr2 = hprf_req (pt, Ti,gt, gr, freq, sigma*2, dt, range, nf, loss);
snr3 = hprf_req (pt, Ti, gt, gr, freq, sigma*3, dt, range, nf, loss);
% plot SNR versus range
figure(1)
rangekm = range ./ 1000;
plot(rangekm,snr3,'k',rangekm,snr2,'k -.',rangekm,snr1,'k:','linewidth',1.5)
grid on
legend('Sigma 0.1 m2','Sigma 0.2 m2','Sigma 0.3 m2')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');