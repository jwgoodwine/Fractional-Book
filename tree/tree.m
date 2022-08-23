more off;
close all;
clear all;

gen = 5;
t = linspace(0,10,200);

k = 1;
b = 1;

ic = zeros(1,2^(gen-1));
icv = zeros(1,2^(gen-1));
ic(1) = 1;
masses = ones(1,2^(gen-1))/10000;
masses(2^(gen-1)) = 1;
fin = 0;

ics = [ic, icv];

x = lsode( @ (x,t) treerhs (x,t,gen,k,b,fin,masses),ics,t);

figure;
hold on;
for i = 1:2^(gen-1)
  plot(t,x(:,i))
endfor

figure;
xcom = zeros(length(t),1);
totalmass = 0;
for i=1:2^(gen-1)
    xcom = xcom + masses(i)*x(:,i);
    totalmass = totalmass + masses(i);
endfor

plot(t,xcom/totalmass,'g');
title('xcom');

figure;
plot(t,x(:,2^(gen-1)),'r');
hold on;

alpha = 1/2;
xfrac = zeros(1,length(t));
for step = 2:length(t)-1
h = t(step+1)-t(step);
  printf("time = %f,\tx=%f\n",t(step+1),xfrac(step));
  sum = sqrt(k*b)*h^(-alpha);
  for j=1:step
    sum = sum + sqrt(k*b)*h^(-alpha)*(-1)^j*bincoeff(alpha,j) ...
	  - sqrt(k*b)*h^(-alpha)*(-1)^j*bincoeff(alpha,j)*xfrac(step+1-j) ...
	  - masses(2^(gen-1))*h^(-2)*(-1)^j*bincoeff(2,j)*xfrac(step+1-j);
  endfor
  xfrac(step+1) = sum/(masses(2^(gen-1))*h^(-2) + sqrt(k*b)*h^(-alpha));
endfor

plot(t,xfrac,'k');
