% Computes a time domain response and compares to fractional.

figure;
hold on;

thetime = zeros(20,1);

for gen = 4:8
  more off;
  clear x;
gen
  t = linspace(0,20,4001);

  k = 1;
  b = 1/4;
  kp = 1;

  ic = zeros(1,2^(gen-1));
  icv = zeros(1,2^(gen-1));
  ics = [ic, icv];

  masses = ones(1,2^(gen-1))/1000;
  masses(1) = 1;
  masses(2^(gen-1)) = 1;

  x = lsode( @ (x,t) treepaperpotrhs (x,t,gen,k,b,masses,kp),ics,t);

  thetime(gen) = cputime();

  eval(
      sprintf("save tree_gen%d-pot.mat",gen)
    );
  
endfor

alpha = 1/2;
dt = t(2)-t(1);

coefs = zeros(1,length(t));
xlast = zeros(1,length(t));
x1frac = zeros(1,length(t));
mass = masses(2^(gen-1));

coefs(1) = -bincoeff(alpha,1);
x1frac(1) = x1(t(1));
x1frac(2) = x1(t(2));
for step = 2:length(t)-1
  printf("time = %f\t x1 = %f\n",t(step),x1frac(step));
  coefs(step) = (-1)^step*bincoeff(alpha,step);
  sum0 = mass/dt^2*(2*xlast(step) - xlast(step-1)); 

  sum1 = sqrt(k*b)/sqrt(dt)*dot(fliplr(coefs(1:step)),
 				(x1frac(1:step) - xlast(1:step)));

  x1frac(step+1) = x1(t(step+1));
  xlast(step+1) = 1/(kp + mass/dt^2 + sqrt(k*b)/sqrt(dt))* ...
      (-kp*gen +sqrt(k*b)*x1frac(step+1)/sqrt(dt) + sum0 + sum1);

endfor

thetime(gen+1) = cputime();

save save tree_lastgen_andfrac-pot.mat;
