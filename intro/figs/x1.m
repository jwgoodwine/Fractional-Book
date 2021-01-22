function ret = x1(t)
  if t < 1 
    ret = 1/2*t^2;
  elseif t < 2
    ret = -1/2*t^2 + 2*t-1;
  else
    ret = 1;
  endif
endfunction
