function y0 = SplineC2tensionat(x0, x, y, dy1, dyn)
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
	g(1) = 3 * (a(2) - a(1)) / h(1) - 3 * dy1;
	g(n) =  3 * dyn - 3 * (a(n) - a(n-1)) / h(n-1);
	for i = 2:n-1
		g(i) = 3 * (a(i+1) - a(i)) / h(i) - 3 * (a(i) - a(i-1)) / h(i-1);
	endfor
	c = Thomas(aa, bb, cc, g);
	for i = 1:n-1
		d(i) = (c(i+1) - c(i)) / (3 * h(i));
		b(i) = (a(i+1) - a(i)) / h(i) - ((2 * c(i) + c(i+1)) * h(i)) / 3;
	endfor
	for i = 2:n
		if x0 <= x(i)
			k = i-1;
			break;
		endif
	endfor
	y0 = a(k) + (b(k) * (x0 - x(k))) + (c(k) * (x0 - x(k)) ^ 2) + (d(k) * (x0 - x(k)) ^ 3); 
end