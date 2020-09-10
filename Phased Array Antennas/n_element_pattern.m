% Use this code to produce Fig. 15.5a and 15.5b based on Eq.(15.35)
clc
clear all
close all
eps = 0.00001;
Lambda = 0.03; 
Thetha0 = 45; % steering angle dergee
k      = 2*pi / Lambda;
theta  = -pi : pi / 10791 : pi;
var = sin(theta);
nelements = 32;
d = Lambda / 2; % d = 1;
num = sin((nelements * k * d * 0.5) .* (var - sind(Thetha0)));
%
if(abs(num) <= eps)
    num = eps;
end
den = sin((k* d * 0.5) .* (var - sind(Thetha0)));
if(abs(den) <= eps)
    den = eps;
end
%
pattern = abs(num ./ den);
maxval = max(pattern);
pattern = pattern ./ maxval;
%
figure(1)
plot(var,pattern,'linewidth', 1.5)
xlabel('\bfsine angle - dimensionless')
ylabel('\bfOne way Array pattern')
grid
%
figure(2)
plot(var,20*log10(pattern),'linewidth', 1.5)
axis ([-1 1 -60 0])
xlabel('\bfsine angle - dimensionless')
ylabel('\bfOne way Power pattern [dB]')
grid;
%
figure(3)
theta = theta +pi/2;
polar(theta,pattern)
title ('\bfOne way Array pattern')

disp(['BW ' num2str(2*asind(Lambda*2.782/(2*pi*d*nelements*cosd(Thetha0)))) ' degree'])
disp(['First Zerro ' num2str(asind(Lambda/(d*nelements*cosd(Thetha0)))) ' degree'])
disp(['First Side Lobe Max ' num2str(asind(3*Lambda/(2*d*nelements*cosd(Thetha0)))) ' degree'])
disp(['First Grating Lobe ' num2str(asind(Lambda/d)) ' degree'])
