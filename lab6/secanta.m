function y = secanta(f,a,b,tol)
  xn = (a*f(b) - b*f(a))/(f(b) - f(a));
  while abs(f(xn)) > tol
    a = b;
    b = xn;
    xn = (a*f(b) - b*f(a))/(f(b) - f(a));
  end
  y = xn;
end
