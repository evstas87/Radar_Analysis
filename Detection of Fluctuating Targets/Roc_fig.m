SNRdB = [8 10 12];
[Pd,Pfa] = rocsnr(SNRdB,'NumPulses',10,'SignalType','Swerling1');
semilogx(Pfa,Pd)
grid on
xlabel('P_{fa}')
ylabel('P_d')
legend('SNR 8 dB','SNR 10 dB','SNR 12 dB',  'location','northwest')
title('Receiver Operating Characteristic (ROC) Curves')

figure
Pfa = [1e-8 1e-6 1e-3];
rocpfa(Pfa,'SignalType','NonfluctuatingCoherent')