clear all; close all; graphics_toolkit("gnuplot");
size = .025*[0,0,162,100];

gh = figure(1,'paperposition',size);
t = linspace(0.01,3,1000);
for a = 0.5:0.5:2
	plot(t,1./sqrt(t).*mlf(0.5,0.5,-a*t),'linewidth',2);
	hold on;
end
axis([0 3 0 3]);
plot(t,exp(-2*t),'linewidth',2);
xlabel('$t$');
ylabel('$x(t)$');
print("fracdiffeqex1a.tex","-depslatex");


gh = figure(2,'paperposition',size);
t = linspace(0.01,3,1000);
for a = 0.5:0.5:2
	plot(t,sqrt(t).*mlf(1/2,3/2,-a*sqrt(t)),'linewidth',2);
	hold on;
end
%axis([0 3 0 3]);
plot(t,1-exp(-2*t),'linewidth',2);
xlabel('$t$');
ylabel('$x(t)$');
print("fracdiffeqex1b.tex","-depslatex");

gh = figure(3,'paperposition',size);
t = linspace(0.01,3,1000);
for a = 0.5:0.5:2
	plot(t,1./sqrt(t).*mlf(0.5,0.5,-a*sqrt(t)) + sqrt(t).*mlf(1/2,3/2,-a*sqrt(t)),'linewidth',2);
	hold on;
end
axis([0 3 0 3]);
xlabel('$t$');
ylabel('$x(t)$');
print("fracdiffeqex1c.tex","-depslatex");


