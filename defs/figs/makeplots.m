clear all; close all; graphics_toolkit("gnuplot")
size = .025*[0,0,162,100];

gh = figure(1,'paperposition',size);
t = linspace(-3.5,-3.0001,100);
plot(t,gamma(t),'b','linewidth',2);
hold on;
t = linspace(-2.9999,-2.0001,100);
plot(t,gamma(t),'b','linewidth',2);
t = linspace(-1.9999,-1.0001,100);
plot(t,gamma(t),'b','linewidth',2);
t = linspace(-0.9999,-0.0001,100);
plot(t,gamma(t),'b','linewidth',2);
t = linspace(0.0001,4.5,400);
plot(t,gamma(t),'b','linewidth',2);
xlabel('$t$');
ylabel('$\Gamma(t)$');
axis([-3.5 4.5 -20 20]);
print("gammaall.tex",'-depslatex');

gh = figure(2,'paperposition',size);
t = linspace(0.000000001,1,777);
plot(t,t,'linewidth',2);
hold on;
alpha = 0.1;
plot(t,gamma(2)/gamma(2-alpha)*t.^(1-alpha),'linewidth',2);
alpha = 0.9;
plot(t,gamma(2)/gamma(2-alpha)*t.^(1-alpha),'linewidth',2);
plot(t,t.^0,'linewidth',2);
axis([-0.004 1 0 1.4]);
xlabel('$t$');
ylabel('fractional derivatives');
print('singex.tex','-depslatex');

gh = figure(3,'paperposition',size);
t = linspace(-3,3,1000);
plot(t,exp(-t.^2),'linewidth',2);
axis([-3 3 0 1.5]);
xlabel('$u$');
ylabel('$e^{-u^2}$');
print('gaussianintegral.tex','-depslatex');

gh = figure(4,'paperposition',size);
t = linspace(-3,3,1000);
plot(t,erf(t),'linewidth',2);
hold on;
plot(t,erfc(t),'linewidth',2);
axis([-3 3 -1.05 2.05]);
xlabel('$t$');
ylabel('erf, erfc');
legend('erf','erfc');
legend('boxoff');
print('erferfc.tex','-depslatex');

gh = figure(5,'paperposition',size);
t = linspace(-1,4,1000);
hold on;
for alpha=0.25:0.25:2
plot(t,mlf(alpha,1,-t),'linewidth',2);
end
axis([-1 4 -1 4])
xlabel('$t$');
ylabel('$E_{\alpha,1}(-t)$');
print('mlfalpha.tex','-depslatex');

gh = figure(6,'paperposition',size);
t = linspace(-1,4,1000);
hold on;
for beta=0.25:0.25:2
plot(t,mlf(1,beta,-t),'linewidth',2);
end
%axis([-1 4 -1 4])
xlabel('$t$');
ylabel('$E_{1,\beta}(-t)$');
print('mlfbeta.tex','-depslatex');

