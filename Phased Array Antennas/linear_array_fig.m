[theta1, patternr1, patterng1] = linear_array(19, 0.5, 0, -1, -1, -3);
[theta2, patternr2, patterng2] = linear_array(19, 0.5, 0, 1, 'hamming', -3);


figure
subplot(211)
plot(theta1,patternr1 + patternr2)
grid on
xlabel('Azimuth [deg]')
ylabel('patternr [dB]')
subplot(212)
plot(theta1,patterng1 + patterng2)
grid on
xlabel('Azimuth [deg]')
ylabel('patterng [dB]')

% [theta, patternr, patterng] = linear_array(19, 0.5, 0, 1, 'hamming', -3);
% [theta, patternr, patterng] = linear_array(19, 0.5, 5, -1, -1, 3);
% [theta, patternr, patterng] = linear_array(19, 0.5, 5, 1, 'hamming', 3);
% [theta, patternr, patterng] = linear_array(19, 0.5, 25, 1, 'hamming', 3);
% [theta, patternr, patterng] = linear_array(19, 1.5, 48, -1, -1, -3);
% [theta, patternr, patterng] = linear_array(19, 1.5, 48, 1, 'hamming', -3);
% [theta, patternr, patterng] = linear_array(19, 1.5, -48, -1, -1, 3);
% [theta, patternr, patterng] = linear_array(19, 1.5, -38, 1, 'hamming', 3);