clc
clear all
close all
freq =167e6;
hr = 8000;
ht = 1000;
R = linspace(400e3,600e3,200); % range in Km
nt =150; % number of point used in calculating infinite series  Maximum is 150
F = diffraction(freq, hr, ht, R, nt);
figure(1)
plot(R/1000,10*log10(abs(F).^2),'k','linewidth',1)
grid
xlabel('Range in Km')
ylabel('One way propagation factor in dB')
title('frequency = 167MHz; hr = 8000 m; ht = 1000m')