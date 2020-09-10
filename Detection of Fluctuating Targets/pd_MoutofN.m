Pd = 0.5;
m = 2;
n = 4;

Pd_mn = 0;


for i = m:n
%    Pd_mn = Pd_mn + binopdf(i,n,Pd);
    Pd_mn = Pd_mn + Pd^i*(1-Pd)^(n-i)* factorial(n) / (factorial(i) * factorial(n-i));
end

disp(Pd_mn)