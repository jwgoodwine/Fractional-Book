% computes some sort of time domain response, probably step and
% compares to a fractional response.

col = 0;
for gen = 3:4
  more off;
  clear x;
  gen
  col = col + 1;
  %gen = 9;

  t = linspace(0,20,4001);

  k = 1;
  b = 1;
  %kp = 1/(gen+1)^2;
  kp = 0;

  ic = zeros(1,2^(gen-1));
  icv = zeros(1,2^(gen-1));
  ics = [ic, icv];

  masses = ones(1,2^(gen-1))/1000;
  masses(1) = 1;
  masses(2^(gen-1)) = 1;

  x = lsode( @ (x,t) treepaperrhs (x,t,gen,k,b,masses,kp),ics,t);

  figure;
  hold on;
  colors = ["b";"r";"g";"k";"c","m";"y";"r";"r";"r"];
  for i = 1:gen-1
    for j=1:2^(i-1)
      eval(
	  sprintf("plot(t,i+x(:,2^(i-1)+j-1),'%s',\"linewidth\",2)",colors(i))
	)
      xlabel("$t$");
      ylabel("$x_{i}$");

      printf("robot = %d\tcolor = %s\n",(2^(i-1)+j-1),colors(i));
    endfor
  endfor
  plot(t,gen+x(:,2^(gen-1)),colors(i+1),"linewidth",2);
  figdim = 0.9*[0, 0, 3.04, 2.128];
  set (gcf, "paperposition",figdim);
  eval(
      sprintf("print(\"gen%dsoln.tex\",\"-depslatex\",\"-color\")",gen)
    )
  
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
		  (-kp*gen + sqrt(k*b)*x1frac(step+1)/sqrt(dt) + sum0 + sum1);

endfor

figure;
plot(t,gen+xlast,'b;fractional;',"linewidth",2);
hold on;
plot(t,gen+x(:,2^(gen-1)),'r;full;',"linewidth",2);
xlabel("$t$");
ylabel("$x_{last}$");
set (gcf, "paperposition",figdim);
print("fracvsexact.tex","-depslatex","-color");
