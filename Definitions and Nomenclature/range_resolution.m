function [delta_R] = range_resolution (var)
% This function computes radar range resolution in meters
%% Inputs:
% var can be either
% var == Bandwidth in Hz
% var == Pulse width in seconds
% % Outputs:
% delta_R == range resolution in meters
% Bandwidth may be equal to (1/pulse width)==> indicator = seconds
%
c = 3.e+8; % speed of light
indicator = input ('Enter 1 for var == Bandwidth, OR 2 for var == Pulse width \n');
switch (indicator)
case 1
delta_R = c / 2.0 / var; % del_r = c/2B
case 2
delta_R = c * var / 2.0; % del_r = c*tau/2
end
return