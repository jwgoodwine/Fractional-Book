clear all; close all; graphics_toolkit("gnuplot")
size = .025*[0,0,162,100];

gh = figure(1,'paperposition',size);
t = linspace(-3,3,1000);
k = 2;
plot(t,t.^2,'linewidth',2);
hold on;
plot(t,2*t,'linewidth',2);
%plot(t,2*t.^0,'linewidth',2);
alpha = 0.5;
plot(t,gamma(k+1)/gamma(k+1-alpha)*t.^(k-alpha),'linewidth',2);
%alpha = 1.5;
xlabel('$t$');
ylabel('function and derivatives');
%legend('function','derivative','half derivative?')
print("fracidea.tex",'-depslatex');

gh = figure(2,'paperposition',size);
t = linspace(0.001,3,1000);
plot(t,2*t,'linewidth',2);
hold on;
plot(t,2*t.^0,'linewidth',2);
alpha = 3/2;
plot(t,gamma(k+1)/gamma(k+1-alpha)*t.^(k-alpha),'linewidth',2);

xlabel('$t$');
ylabel('function and derivatives');
print("fracidea2.tex",'-depslatex');

gh = figure(3,'paperposition',size);
t = linspace(0,3,1000);
k = 2;
plot(t,t.^2,'linewidth',2);
hold on;
plot(t,2*t,'linewidth',2);
for alpha=0.2:0.2:0.8
	plot(t,gamma(k+1)/gamma(k+1-alpha)*t.^(k-alpha),'linewidth',2);
end
xlabel('$t$');
ylabel('function and derivatives');
print("fracidea3.tex",'-depslatex');

gh = figure(4,'paperposition',size);
t = linspace(-2*pi,2*pi,1000);
plot(t,sin(t),'linewidth',2);
hold on;
plot(t,cos(t),'linewidth',2);
plot(t,-sin(t),'linewidth',2);
annotation('textarrow',[.625 .535],[.775 .775],'string','first derivative','headwidth',4,'headlength',4);
annotation('textarrow',[.625 .44],[.85 .85],'string','second derivatives','headwidth',4,'headlength',4);
axis([-2*pi 2*pi -2 2])
xlabel('$t$');
ylabel('$\sin t$ and derivatives');
print("fracidea4.tex",'-depslatex');

gh = figure(5,'paperposition',size);
t = linspace(-2*pi,2*pi,1000);
plot(t,sin(t),'linewidth',2);
hold on;
plot(t,sin(t+pi/4),'linewidth',2);
annotation('textarrow',[.625 .575],[.775 .775],'string','half derivative?','headwidth',4,'headlength',4);
axis([-2*pi 2*pi -2 2])
xlabel('$t$');
ylabel('$\sin t$ and derivatives');
print("fracidea5.tex",'-depslatex');

gh = figure(6,'paperposition',size);
z = linspace(0,5.5,1000);
plot(z,gamma(z),'linewidth',2);
xlabel('$z$');
ylabel('$\Gamma(z)$');
hold on;
axis([0 5.5 0 25])
plot(1,1,'xr','linewidth',2);
plot(2,1,'xr','linewidth',2);
plot(3,2,'xr','linewidth',2);
plot(4,6,'xr','linewidth',2);
plot(5,24,'xr','linewidth',2);
print("gamma.tex",'-depslatex');

close all;
gh = figure(7,'paperposition',size);
t = linspace(0.01,2,1000);
plot(t,t.^(0.5),'linewidth',3);
hold on;
for alpha=-1:.5:1
	plot(t,gamma(1.5)/gamma(1.5-alpha)*t.^(1/2-alpha),'linewidth',2);
end
plot(t,t.^(0.5),'b','linewidth',3);
xlabel('$t$');
ylabel('fractional derivatives of $f = \sqrt{t}$.');
print("monex.tex",'-depslatex');

