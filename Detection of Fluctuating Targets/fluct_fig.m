% Use this program to reproduce Fig. 13.13 of text
clear all
close all
index = 0.;
pfa = 1e-9;
np  = 1;
nfa = np * log(2)/pfa;
for pd = 0.01:.05:1
    index = index + 1;
%     [Lf,Pd_Sw5] = fluct_loss(pd, 1e-7,1,1);
    [Lf] = fluct(pd, nfa,np,1);

    Lf1(index) = Lf;
%     [Lf,Pd_Sw5] = fluct_loss(pd, 1e-7,1,4);
    [Lf] = fluct(pd, nfa,np,4);
    Lf4(index) = Lf;
    
    [Lf] = fluct(pd, nfa,np,0);
    Lf0(index) = Lf;
end
pd = 0.01:.05:1;
figure (3)
plot(pd,Lf1 - Lf0 , 'k',pd,Lf4 - Lf0 ,'K:','linewidth',1.5)  % We need more SNR for fluctuatinn case
xlabel('\bfProbability of detection')
ylabel('\bfFluctuation loss - dB')
legend('Swerling I & II','Swerling III & IV')
title('P_f_a = 10^-^9, n_p = 1')
grid on