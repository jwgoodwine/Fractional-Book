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


%gh = figure(5,'paperposition',size);
%t = linspace(-1,4,1000);
%hold on;
%for alpha=0.25:0.25:2
%plot(t,mlf(alpha,1,-t),'linewidth',2);
%end
%axis([-1 4 -1 4])
%xlabel('$t$');
%ylabel('$E_{\alpha,1}(-t)$');
%print('mlfalpha.tex','-depslatex');

%gh = figure(6,'paperposition',size);
%t = linspace(-1,4,1000);
%hold on;
%for beta=0.25:0.25:2
%plot(t,mlf(1,beta,-t),'linewidth',2);
%end
%%axis([-1 4 -1 4])
%xlabel('$t$');
%ylabel('$E_{1,\beta}(-t)$');
%print('mlfbeta.tex','-depslatex');
%
%gh = figure(7,'paperposition',size);
%data = [];
%for k=0:10
%	data = vertcat(data,[bincoeff(4,k) bincoeff(3.95, k) bincoeff(3.5,k)]);
%end
%plot(data,'o','linewidth',2,'markersize',4);
%legend('$n=4$','$n=3.95$','$n=3.5$');
%xlabel('$k$');
%ylabel('binomial coefficient');
%print('bincoeffex.tex','-depslatex');

%gh = figure(8,'paperposition',size);
%t = linspace(0,5,1000);
%plot(t,t,'linewidth',2);
%hold on;
%plot(t,0.5*t.^2,'linewidth',2);
%plot(t,4/(3*sqrt(pi))*t.^(3/2),'linewidth',2);
%xlabel('$t$');
%ylabel('$t$, its integral and its half integral');
%print('fracint1.tex','-depslatex');

%gh = figure(9,'paperposition',size);
%t = linspace(0,3,1000);
%plot(t,exp(2*t),'linewidth',2);
%hold on
%plot(t,exp(2*t)/2,'linewidth',2);
%plot(t,1/sqrt(2)*exp(2*t).*erf(sqrt(2*t)),'linewidth',2);
%xlabel('$t$');
%ylabel('$\e^{2 t}$, its integral and half integral');
%print('fracint2a.tex','-depslatex');

%axis([0 1 0 5])
%print('fracint2b.tex','-depslatex');

%gh = figure(10,'paperposition',size);
%t = linspace(0,10,1000);
%soln = zeros(1,length(t));
%f = @(z,t) ((t - z).^(-1/2)).*cos(3*z);
%for i=1:length(t)
%	soln(i) = 1/gamma(1/2)*integral(@(z) f(z,t(i)),0,t(i));
%end
%plot(t,cos(3*t),'linewidth',2);
%hold on;
%plot(t,1/3*sin(3*t),'linewidth',2);
%plot(t,soln,'linewidth',2);
%xlabel('$t$');
%ylabel('$\cos 3 t$ and its integral and half integral');
%print('fracint3.tex','-depslatex');

%gh = figure(11,'paperposition',size)
%t = linspace(0.001,5,1000);
%plot(t,t+1,'linewidth',2);
%hold on;
%plot(t,2./sqrt(pi)*sqrt(t)+1./(sqrt(pi*t)),'linewidth',2);
%plot(t,2./sqrt(pi)*sqrt(t),'linewidth',2);
%axis([0 5 0 10]);
%xlabel('$t$');
%ylabel('$t + 1$ and its half derivative');
%print('fracderivex1.tex','-depslatex');

close all;
gh = figure(12,'paperposition',size)
t = linspace(0,10,1001);
dt = t(2)-t(1);
alpha = 1.1;
deriv = 0;
f = cos(3*t);
coefs = 0;
coefs(1) = bincoeff(alpha,0);
deriv(1) = 0;
for n = 2:length(t)
	coefs(n) = (-1)^(n-1)*bincoeff(alpha,(n-1));
	sum = dot(fliplr(f(1:n)),coefs)/dt^alpha;
	deriv(n) = sum;
end
plot(t,f,'linewidth',2);
hold on;
plot(t,-3*sin(3*t),'linewidth',2);
plot(t,deriv,'linewidth',2);
xlabel('$t$');
ylabel('half derivative of $\cos 3 t$');
print('gwex1.tex','-depslatex');


