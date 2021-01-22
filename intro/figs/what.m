m1 = 1;
m2 = 1;
k = 1;
b = 1;

L1num = 1;
L1den = k;
L2num = 1;
L2den = [b 0];

[Gden,Gnum] = tfadd(L1den,L1num,L2den,L2num);

newden = polyadd(
                 conv(
                      polyadd(conv([m1 0 0],Gden),Gnum),
                      polyadd(conv([m2 0 0],Gden),Gnum)),conv(Gnum,Gnum));
newnum = conv(Gnum,Gden);

bode(tf(newnum,newden));
