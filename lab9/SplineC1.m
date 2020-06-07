function yi = SplineC1(x, y, dy, xi)
  n = length(x);
	for i = 1 : n-1
		a(i) = y(i);
		h(i) = x(i+1) - x(i);
		b(i) = y(i) + h(i)*dy(i)/3;
		c(i) = y(i+1) - h(i)*dy(i+1)/3;
    d(i) = y(i+1);
	endfor
	for i = 2 : n
		if xi <= x(i)
			k = i - 1;
			break;
		endif
	endfor
	t = (xi - x(k)) / h(k);
	yi = (a(k)*(1-t)^3) + (3*b(k)*t*(1-t)^2)+(3*c(k)...
  *t^2*(1-t))+(d(k)*t^3);
endfunction