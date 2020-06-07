function yi = SplineC2natural(x, y, xi)
	n = length(x);
	h(1:n-1) = x(2:n) - x(1:n-1);
	a(1:n) = y(1:n);
	aa(1 : n-1) = h(1 : n-1);
	bb(1) = 2 * h(1);
	bb(n) = 2 * h(n-1);
	for i = 2 : n-1
		bb(i) = 2 * (h(i-1) + h(i));
	end
	cc(1 : n-1) = h(1 : n-1);
	cc(1) = 0;
	for i = 2:n-1
		dd(i) = 3 * (a(i+1) - a(i)) / h(i) - 3 * (a(i) - a(i-1)) / h(i-1);
	endfor
	c = Thomas(aa, bb, cc, dd);
	for i = 1:n-2
		d(i) = (c(i+1) - c(i)) / (3 * h(i));
		b(i) = (a(i+1) - a(i)) / h(i) - ((2 * c(i) + c(i+1)) * h(i)) / 3;
	endfor
  k = 1;
	for i = 2:n - 1
		if xi <= x(i)
			k = i-1;
			break;
		endif
	endfor
	yi = a(k) + (b(k) * (xi - x(k))) + (c(k) * (xi - x(k)) ^ 2) + (d(k) * (xi - x(k)) ^ 3); 
end