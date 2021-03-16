close all; clear all;
t = linspace(0,10,100001);
dt = t(2)-t(1);
alpha = .5;
f = cos(3*t);
coefs = 0;
coefs(1) = (-1)^0*bincoeff(alpha,0);
deriv(1)=0;
for n=2:length(t)
	coefs(n) = (-1)^(n-1)*bincoeff(alpha,(n-1));
	deriv(n) = dot(fliplr(f(1:n)),coefs)/(dt^alpha);
end
plot(t,f,'linewidth',2);
axis([0 10 -3.2 6])
hold on;
plot(t,-3*sin(3*t),'linewidth',2);
plot(t,deriv,'linewidth',3);
function y = bincoeff(alpha,k)
	y = gamma(alpha+1)/(gamma(k+1)*gamma(alpha-k+1));
end

