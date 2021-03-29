%% controls roots stability examples
% numericall solve x' + a D^{1/2} x + b x = 1 with all zero initial
% conditions of all orders
close all; clear all;

a = -2; b = 5; alpha = 1/2;
t = linspace(0,5,6000);
dt = t(2)-t(1);
x = 0;
coefs = (-1)^1*bincoeff(alpha,1);

for k=2:length(t)
    thesum = dot(fliplr(x),coefs);
   x(k) = (1 - a*thesum/(dt^alpha) + x(k-1)/dt - b*x(k-1))/(1/dt + a/(dt^alpha));
   coefs(k) = (-1)^(k)*bincoeff(alpha,k);
end
plot(t,x);

function y = bincoeff(alpha,k)
    if(alpha < k)
        y = real((1/pi) * exp (gammaln (alpha + 1) - gammaln (k + 1)...
            + gammaln (k - alpha) ...
            + log (sin (pi * (alpha - k + 1)))));
    else
        y =  real(exp (gammaln (alpha + 1) - gammaln (k + 1) ...
            - gammaln (alpha - k + 1)));
    end
end
