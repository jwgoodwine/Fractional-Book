function ret = x1dot(t)
  if t < 1 
    ret = t;
  elseif t < 2
    ret = -t + 2;
  else
    ret = 0;
  endif
endfunction
