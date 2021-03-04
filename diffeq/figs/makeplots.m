clear all; close all; graphics_toolkit("gnuplot");
size = .025*[0,0,162,100];

%gh = figure(1,'paperposition',size);
%t = linspace(0.01,3,1000);
%for a = 0.5:0.5:2
%	plot(t,1./sqrt(t).*mlf(0.5,0.5,-a*t),'linewidth',2);
%	hold on;
%end
%axis([0 3 0 3]);
%plot(t,exp(-2*t),'linewidth',2);
%xlabel('$t$');
%ylabel('$x(t)$');
%print("fracdiffeqex1a.tex","-depslatex");


%gh = figure(2,'paperposition',size);
%t = linspace(0.01,3,1000);
%for a = 0.5:0.5:2
%	plot(t,sqrt(t).*mlf(1/2,3/2,-a*sqrt(t)),'linewidth',2);
%	hold on;
%end
%%axis([0 3 0 3]);
%plot(t,1-exp(-2*t),'linewidth',2);
%xlabel('$t$');
%ylabel('$x(t)$');
%print("fracdiffeqex1b.tex","-depslatex");

%gh = figure(3,'paperposition',size);
%t = linspace(0.01,3,1000);
%for a = 0.5:0.5:2
%	plot(t,1./sqrt(t).*mlf(0.5,0.5,-a*sqrt(t)) + sqrt(t).*mlf(1/2,3/2,-a*sqrt(t)),'linewidth',2);
%	hold on;
%end
%axis([0 3 0 3]);
%xlabel('$t$');
%ylabel('$x(t)$');
%print("fracdiffeqex1c.tex","-depslatex");

gh = figure(4,'paperposition',size);
t = linspace(0,20,1003);
gam = 0;
alpha = 2 - gam; beta = 3;
qm=1;
plot(t,t.^(beta-1).*mlf(alpha,beta,-qm*t.^alpha,7),'linewidth',2);
xlabel('$t$');
ylabel('$x(t)$');
hold on;
qm = 2;
plot(t,t.^(beta-1).*mlf(alpha,beta,-qm*t.^alpha,7),'linewidth',2);
print('structurewall1.tex','-depslatex');

gh = figure(5,'paperposition',size);
t = linspace(0,20,258);
gam = 1;
alpha = 2 - gam; beta = 3;
qm=1;
plot(t,t.^(beta-1).*mlf(alpha,beta,-qm*t.^alpha,10),'linewidth',2);
xlabel('$t$');
ylabel('$x(t)$');
hold on;
print('structurewall2.tex','-depslatex');

gh = figure(6,'paperposition',size);
t = linspace(0,20,258);
for gam=0:.25:1.99
	alpha = 2 - gam; beta = 3;
	qm=1;
	plot(t,t.^(beta-1).*mlf(alpha,beta,-qm*t.^alpha,10),'linewidth',2);
	hold on;
end
axis([0 10 0 10]);
xlabel('$t$');
ylabel('$x(t)$');
print('structurewall3.tex','-depslatex');

