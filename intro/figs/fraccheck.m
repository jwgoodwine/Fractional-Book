% seems to plot step response for various orders of fractional for an
% equation given in the ICRA paper.  

clear all;
close all;
more off;

alpha = 0.25;
t = linspace(0,10,10000);

dt = t(2)-t(1);
# x(1) = 0;
# coefs(1) = -bincoeff(alpha,1);

# for i = 2:length(t)
#   t(i)
#   sum = dot(fliplr(x),coefs);

#   x(i) = (1 - sum/(dt^alpha))/(2 + 1/dt^alpha);
#   coefs(i) = (-1)^i*bincoeff(alpha,i);
# endfor

#plot(t,x,'b;$\alpha = 0.25$;',"linewidth",2);

figure;
hold on;
colorcount = 0;
colors = ["b";"r";"g";"k";"m";"c";"r";"r";"r"];
for alpha = [1/3 2/3 1 4/3 5/3 2]
  colorcount++;
  x = 0;
  coefs = 0;
  alpha
  coefs(1) = -bincoeff(alpha,1);

  for i = 2:length(t)
    sum = dot(fliplr(x),coefs);

    x(i) = (1 - sum/(dt^alpha))/(2 + 1/dt^alpha);
    coefs(i) = (-1)^i*bincoeff(alpha,i);
  endfor
  eval (
	sprintf (
		 "plot(t,x,'%s;$alpha = %1.2f$;',\"linewidth\",2)",colors(colorcount),alpha
		 )
	)
endfor

axis([0 10 -.25 2.5]);
xlabel("$t$")
ylabel("$x(t)$")

figdim = 0.9*[0, 0, 3.04, 2.128];
set (gcf, "paperposition",figdim);
print("fracsoln.tex","-depslatex","-color");
