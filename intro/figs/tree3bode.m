% More trasnfer function stuff for the tree. Not sure if the output is
% ultimately any different than tree2bode

more off;
close all;
clear all;

gen = 8;

k = 1;
b = 1;
m1 = 1;
m2 = 1;

w = logspace(-3,3,1000);
s = I*w;

L1 = 1/k;
L2 = 1./(b*s);

transf = 1./(1./L1 + 1./L2);

for i=2:gen
  transf = 1./(1./(L1 + transf) + 1./(L2 + transf));
endfor


figure;
semilogx(w,20*log10(abs(transf)),'r');
grid on;

figure;
semilogx(w,180/pi*angle(transf),'r');
grid on;

mag = abs(1./sqrt(b*k*I*w));
phi = 180/pi*angle(1./sqrt(b*k*I*w));

figure;
semilogx(w,20*log10(mag));

figure;
semilogx(w,phi);

figure;

L1num = 1;
L1den = k;
L2num = 1;
L2den = [b 0];

[Gden,Gnum] = tfadd(L1den,L1num,L2den,L2num);

step(tf(Gnum,Gden));


newden = polyadd(
		 conv(
		      polyadd(conv([m1 0 0],Gden),Gnum),
		      polyadd(conv([m2 0 0],Gden),Gnum)),conv(Gnum,Gnum));
newnum = conv(Gnum,Gden);

figure;
bode(tf(newnum,newden));
figure;
step(tf(newnum,newden));


