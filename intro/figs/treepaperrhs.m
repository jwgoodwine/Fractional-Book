function xdot = treepaperrhs(x,t,gen,k,b,masses,kp)
%  t

  xdot = zeros(1,2^(gen));    % think of as 2*(2^(gen-1))
  for i = 1:2^(gen-1)         % first half of xdot
    xdot(i) = x(i+2^(gen-1));
  end

  if t<1
    xdot(2^(gen-1)+1) = 1;
  elseif t<2
    xdot(2^(gen-1)+1) = -1;
  else
    xdot(2^(gen-1)+1) = 0;
  endif

  % now accelerations
  % first mass separately, as well as last
  % first mass has specified position.


  for i = 2:gen-1
    for j = 2^(i-1):2:2^(i)-1

      prior = floor(j/2+.01);
      nextlow = 2*j;
      nexthigh = 2*j+1;
      if nexthigh > 2^(gen-1);
	nexthigh = 2^(gen-1);
      end
      if nextlow > 2^(gen-1)
	nextlow = 2^(gen-1);
      end
      
      xdot(2^(gen-1)+j) = 1/masses(j)*(b*(xdot(prior) - xdot(j)) ...
	  + k*(x(nexthigh) - x(j)) + b*(xdot(nextlow) - xdot(j)));
      
      nexthigh = nexthigh+2;
      if nexthigh > 2^(gen-1);
	nexthigh = 2^(gen-1);
      endif
      nextlow = nextlow+2;
      if nextlow > 2^(gen-1)
	nextlow = 2^(gen-1);
      endif
      
      xdot(2^(gen-1)+j+1) = 1/masses(j+1)*(k*(x(prior) - x(j+1)) ...
		+ k*(x(nexthigh) - x(j+1))+ b*(xdot(nextlow) - xdot(j+1)));

    end
  end

  lastforce = 0;
  for j=2^(gen-2):2:2^(gen-1)-1
    lastforce = lastforce + b*(xdot(j)-xdot(2^(gen-1))) ... 
	  + k*(x(j)-x(2^(gen-1)));
    lastforce = lastforce + b*(xdot(j+1)-xdot(2^(gen-1))) ...
      + k*(x(j+1)-x(2^(gen-1)));
  endfor
  % add potential
  lastforce = lastforce - kp*(x(2^(gen-1))+gen);

  xdot(2^(gen)) = lastforce/masses(2^(gen-1));

%  x(1) = x1(t);
%  x(2^(gen-1)+1) = x1dot(t);

endfunction
