clear all;
close all;

alpha = linspace(0,5,1000);

plot(alpha,gamma(alpha),"linewidth",2);
axis([0 5 0 30]);
xlabel("$\alpha$");
ylabel("$\Gamma(\alpha)$")
hold on;

plot(2,1,'kx',"markersize",4,"markeredgecolor",'k',"markerfacecolor",'k');
plot(3,2,'kx',"markersize",4,"markeredgecolor",'k',"markerfacecolor",'k');
plot(4,6,'kx',"markersize",4,"markeredgecolor",'k',"markerfacecolor",'k');
plot(5,24,'kx',"markersize",4,"markeredgecolor",'k',"markerfacecolor",'k');

figdim = [0, 0, 3.04, 2.128];
set (gcf, "paperposition",figdim);
print("gamma.tex","-depslatex","-color","-tight");
