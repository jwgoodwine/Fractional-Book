clear all; close all; graphics_toolkit("gnuplot")
size = .025*[0,0,162,100];

gh = figure(1,'paperposition',size);
alpha = 1; beta=2; a=-2;
t = linspace(0,5,1000);
plot(t,mlf(alpha,beta,a*t),'linewidth',2);
hold on;
plot(t,1/alpha*t.^((1-beta)/alpha).*exp((a*t).^(1/alpha)),'linewidth',2);
axis([0 5 -1 10])
xlabel('$t$');
ylabel('$E_{1,2}(-2 t)$, asymptotic approximation');
print("mlfasyex1.tex","-depslatex");

gh = figure(2,'paperposition',size);
alpha = 3/2; beta=1/2; a=-1;
t = linspace(0,30,1000);
plot(t,mlf(alpha,beta,a*t),'linewidth',2);
hold on;
plot(t,1/alpha*t.^((1-beta)/alpha).*exp((a*t).^(1/alpha)),'linewidth',2);
axis([0 t(length(t)) -1 2])
xlabel('$t$');
ylabel('$E_{2,1}(-t)$, asymptotic approximation');
print("mlfasyex2.tex","-depslatex");

gh = figure(3,'paperposition',size);
alpha = 1; beta=2; a=1;
t = linspace(0,5,1000);
plot(t,mlf(alpha,beta,a*t),'linewidth',2);
hold on;
plot(t,1/alpha*t.^((1-beta)/alpha).*exp((a*t).^(1/alpha)),'linewidth',2);
axis([0 5 -1 10]) 
xlabel('$t$');
ylabel('$E_{1,2}(t)$, asymptotic approximation');
print("mlfasyex3.tex","-depslatex");

