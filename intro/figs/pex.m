close all;
clear all;

t = linspace(-2,2,1000);

plot(t,t.^2,'b;$\alpha = 0$;',"linewidth",2);
hold on;

i = 0.2;
plot(t,gamma(3)/gamma(3-i)*t.^(2-i),'r;$\alpha = 0.2$;',"linewidth",2);
i = 0.4;
plot(t,gamma(3)/gamma(3-i)*t.^(2-i),'m;$\alpha = 0.4$;',"linewidth",2);
i = 0.6;
plot(t,gamma(3)/gamma(3-i)*t.^(2-i),'k;$\alpha = 0.6$;',"linewidth",2);
i = 0.8;
plot(t,gamma(3)/gamma(3-i)*t.^(2-i),'g;$\alpha = 0.8$;',"linewidth",2);
i = 1.0;
plot(t,gamma(3)/gamma(3-i)*t.^(2-i),'c;$\alpha = 1$;',"linewidth",2);

grid on;

axis([-2 2 -4 12]);
xlabel("$t$")
ylabel("$frac{d^\alpha}{dt^\alpha}t^2$")

%figdim = 0.9*[0, 0, 3.04, 2.128];
%set (gcf, "paperposition",figdim);
%print("polyex.tex","-depslatex","-color");

figure;

dt = t(2)-t(1);
f(1) = t(1)^2;
for i = 2:length(t)
    for j = 1:length(f)
	
    endfor
endfor
