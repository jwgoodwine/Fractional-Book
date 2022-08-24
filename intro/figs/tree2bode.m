more off;
close all;
clear all;

gen = 6;

k = 1;
b = 2;
m1 = 1;
m2 = 1;

L1num = 1;
L1den = k;
L2num = 1;
L2den = [b 0];

[Gden,Gnum] = tfadd(L1den,L1num,L2den,L2num);

for i=2:gen
  [den1,num1] = tfadd(L1num,L1den,Gnum,Gden);
  [den2,num2] = tfadd(L2num,L2den,Gnum,Gden);
  [Gden,Gnum] = tfadd(num1,den1,num2,den2);
endfor

printf("order: den = %f\t num = %f\n",length(Gden),length(Gnum));
figure;
bode(tf(Gnum,Gden));
figdim = 0.9*[0, 0, 3.04, 2.128];
set (gcf, "paperposition",figdim);
%print("bodeelement.tex","-depslatex","-color");

figure;
mypzmap(tf(Gnum,Gden))
figdim = 0.9*[0, 0, 3.04, 2.128];
set (gcf, "paperposition",figdim);
%print("pzmapelement.tex","-depslatex","-color");


figure;
w = logspace(-3,3,1000);
s = I*w;
semilogx(w,20*log10(abs(1./sqrt(b*k*s))),'r');
grid on;
figure;
semilogx(w,180/pi*angle(1./sqrt(b*k*s)),'r');
grid on;

## figure;
## step(tf(Gnum,Gden));

## newden = polyadd(
## 		 conv(
## 		      polyadd(
## 			      conv(Gnum,[m1 0 0]),Gden),
## 		      polyadd(conv(Gnum,[m2 0 0]),Gden)),
## 		 -conv(Gden,Gden));

## newnum = conv(Gnum,Gden);

## figure;
## bode(tf(newnum,newden));
## figure;
## pzmap(tf(newnum,newden));
## figure;
## step(tf(newnum,newden),1,10);
## figure;
## impulse(tf(newnum,newden),1,10);
