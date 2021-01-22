function [num, den] = tfadd(num1,den1,num2,den2)
  num = polyadd(conv(num1,den2),conv(num2,den1));
  den =  conv(den1,den2);
 endfunction




