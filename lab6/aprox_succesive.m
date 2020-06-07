function x = aprox_succesive(x0, f, tol)
  function f=g(x)
    f=7/(x^2-2*x+5);
  endfunction
  ok=1;
  while ok==1
    x=g(x0);
    if  abs(f(x)) < tol
      break;
    endif
      x0=x;
  end
end