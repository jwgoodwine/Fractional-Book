%% fractional multistep method from Deltham, 2002
% solve Caputo: D(1/2) x + x = 1, x(0)=0, x'(0)=-1
% two initial conditions assumes 1 < alpha < 2
% so f = 1 - x;
close all; clear all;
alpha = 1.5;
t = linspace(0,10,100); dt = t(2)-t(1);
exactsoln = t.^alpha.*mlf(alpha, alpha+1, -t.^alpha) - t.*mlf(alpha,2,-t.^alpha);
plot(t,exactsoln); hold on; grid on;

%% now implement fractional multistep from the paper
for k=1:length(t)
   b(k) = k^alpha - (k-1)^alpha;
   a(k) = (k+1)^(alpha+1) -2*k^(alpha+1) + (k-1)^(alpha+1);
end
x = 0;
for j=1:length(t)
    thesum = 0;
    for k=0:j-1
        thesum = thesum + b(j-k)*f(x(k+1),k*dt);
    end
   p = -(j*dt) + dt^alpha/gamma(alpha+1)*thesum;
   thesum = 0;
   if(j>1) 
    for k=1:j-1
        thesum = thesum + a(j-k)*f(x(k+1),k*dt);
    end
   end
    x(j+1) = -(j*dt) + dt^alpha/gamma(alpha+2)*( ...
        f(p,j*dt) + ((j-1)^(alpha+1) - (j-1-alpha)*j^alpha)*f(x(1),0) ...
    + thesum);
end

plot(t,x(1:length(t)));
%axis([0, t(length(t)), -2 2])
function r = f(x,t)
    r = 1 - x;
end