clear all; close all; graphics_toolkit("gnuplot")
size = .025*[0,0,162,100];

gh = figure(1,'paperposition',size);

t = linspace(0,10,1001);
dt = t(2)-t(1);
alpha = 1/2.
alpha = alphas(i);
x = 0;
coefs = 0;
coefs(1) = (-1)^1*bincoeff(alpha,1);
x(1)=0;
for n=2:length(t)
	sum = dot(fliplr(x),coefs);
	coefs(n) = (-1)^(n)*bincoeff(alpha,(n));
	x(n) = (1 - sum/dt^alpha)/(1/dt^alpha + 2);
end
plot(t,x,'linewidth',2);
hold on;


function y = bincoeff(alpha,k)
    y = gamma(alpha+1)/(gamma(k+1)*gamma(alpha-k+1));
end
