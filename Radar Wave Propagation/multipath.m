% This program calculates and plots the propagation factor versus
% target range with a fixed target hieght.
% The free space radar-to-target range is assumed to be known.
fprintf('****** WARNING ****** \n')
fprintf('Diffraction is not accounted for in this routine')
clear all ; close all
eps = 0.0015;
%%%%%%%%%%%%% input %%%%%%%%%%%%%%%%
ro = 6375e3; % earth radius
re = ro * 4 /3; % 4/3 earth radius
freq = 3000e6; % frequnecy
lambda = 3.0e8 / freq; % wavelength
hr = 100*.3048; % radar height in meters
ht = 200*.3048; % target height in meters
Rd1 = linspace(2e3, 45e3, 500); % slant range 3 to 55 Km 500 points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%determine whether the target is beyond the radar's line of sight
range_to_horizon = sqrt(2*re) * (sqrt(ht) + sqrt(hr)); % range to horizon
index = find(Rd1 > range_to_horizon);
if isempty(index);
    Rd = Rd1;
else
    Rd = Rd1(1:index(1)-1);
    fprintf('****** WARNING ****** \n')
    fprintf('Maximum range is beyond radar line of sight. \n')
    fprintf('****** WARNING ****** \n')
end
val1 = (re + hr).^2 + (re + ht).^2 - Rd.^2;
val2 = 2 .* (re +hr) .* (re + ht);
phi = acos(val1./val2); % Eq. (8.77)
r = re .* phi; % Eq. (8.71)
p = sqrt(re .* (ht + hr) + (r.^2 ./4)) .* 2 ./ sqrt(3); %Eq.(8.68)
exci = asin((2 .* re .* r .* (ht - hr) ./ p.^3)); % Eq. (8.69)
r1 = (r ./ 2) - p .* sin(exci ./3);
phi1 = r1 ./ re; % Eq. (8.70)
r2 = r - r1;
phi2 = r2 ./ re; % Eq. (8.70)
R1 = sqrt(hr.^2 + 4 .* re .* (re + hr) .* (sin(phi1./2)).^2); % Eq. (8.74)
R2 = sqrt(ht.^2 + 4 .* re .* (re + ht) .* (sin(phi2./2)).^2); % Eq. (8.75)
psi = asin((2 .* re .* hr + hr.^2 - R1.^2) ./ (2 .* re .* R1));
deltaR = (4 .* R1 .* R2 .* (sin(psi)).^2) ./ (R1 + R2 + Rd); % Eq. (8.65)
%%%%%%%%%%%%% input surface roughness %%%%%%%%%%%%%%%%
hrms = 1; %
psi = psi .* 180 ./ pi;
[Sr] = surf_rough(hrms, freq, psi);
%%%%%%%%%%%%% input divergence %%%%%%%%%%%%%%%%
[D] = divergence(r1, r2, ht, hr, psi);
%%%%%%%%%%%%% input smooth earth ref. coefficient %%%%%%%%%%%
epsp = 13.7;
epspp = .01;
[rh,rv] = ref_coef (psi, epsp, epspp);
%D = 1;
Sr =1;
gamav = abs(rv);
phv = angle(rv);
gamah = abs(rh);
phh = angle (rh);
gamav =1;
phv = -pi;
Gamma_mod = abs(gamav .* D .* Sr); % Eq. (8.39)
Gamma_phase = phv; %
rho = Gamma_mod;
delta_phi = 2 .* pi .* deltaR ./ lambda; % Eq. (8.56)
alpha = delta_phi + phv;
F = ( 1 + rho.^2 + 2 .* rho .* cos( alpha)); % Eq. (8.48)
Ro = 185.2e3; % refrence range in Km
F_free = 40 .* log10(Ro ./ Rd);
F_dbr = 20 .* log10( F ) + F_free;
F_db = 20 .* log10( eps + F );
figure(1)
plot(Rd./1000, F_db,'k','linewidth',1)
grid
xlabel('slant range in Km')
ylabel('propagation factor in dB')
axis tight
axis([2 Rd(end)/1000 -60 20])
figure(2)
plot(Rd./1000, F_dbr,'k',Rd./1000, F_free,'k-.','linewidth',1)
grid
xlabel('slant range in Km')
ylabel('propagation factor in dB')
axis tight
axis([2 Rd(end)/1000 -40 80])
legend('multipath','free space')