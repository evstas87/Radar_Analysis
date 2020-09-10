% This program is used to produce Fig. 13.10
clc
close all
clear all
pfa = 1e-9;
nfa = log(2) / pfa;
index = 0;
for snr = -10:.5:30
    index = index +1;
    prob1(index) = pd_swerling3 (nfa, 1, snr);
    prob10(index) = pd_swerling3 (nfa, 10, snr);
    prob50(index) = pd_swerling3(nfa, 50, snr);
    prob100(index) = pd_swerling3 (nfa, 100, snr);
end
x = -10:.5:30;
plot(x, prob1,'k',x,prob10,'k:',x,prob50,'k--', x, prob100,'k-.','linewidth',1.5);
axis([-10 30 0 1])
xlabel ('SNR in dB')
ylabel ('Probability of detection')
legend('np = 1','np = 10','np = 50','np = 100')
grid on