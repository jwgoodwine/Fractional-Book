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

