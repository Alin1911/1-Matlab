function [sol, iter] = newtonm(x0,f,J,tol)
  iter=0;
  while 1
    x=x0-inv(J(x0))*f(x0);
    if abs(x-x0)<tol
      sol=x;
      break;
    endif
    iter=iter+1;
    x0=x;
  endwhile
endfunction