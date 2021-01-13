clear all; close all; graphics_toolkit("gnuplot")
size = .025*[0,0,162,100];

gh = figure(1,'paperposition',size);
t = linspace(0,3,1000);
plot(t,t.^2);
hold on;
plot(t,2*t);
plot(t,2*t.^0);
%legend('$f(t)$','$\frac{df}{dt}(t)$','$\frac{d^2f}{dt^2}(t)$')
annotation(gh,"textarrow",[0.8 .9],[.8 .8],"headstyle","plain","headwidth",3,"headlength",3,"string","$f(t)$")
annotation(gh,"textarrow",[0.7 .9],[.7 .6],"headstyle","plain","headwidth",3,"headlength",3,"string","$f^\\prime (t)$")
print("fracidea.tex",'-depslatex');


