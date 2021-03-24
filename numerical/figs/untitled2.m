%% fractional multistep method from Deltham, 2002
% solve Caputo: D(1/2) x + x = 1, x(0)=0, x'(0)=-1
% two initial conditions assumes 1 < alpha < 2
close all; clear all;
alpha = 1.5;
t = linspace(0,10,1000); dt = t(2)-t(1);
soln = t.^alpha.*mlf(alpha, alpha+1, -t.^alpha) - t.*mlf(alpha,2,-t.^alpha);
plot(t,soln);