function x = Thomas(ld,md,ud,a)
	n = length(a);
 	ld = [0 ld];
	ud(1) = ud(1) / md(1);
	a(1) = a(1) / md(1);

	for i = 2 : n-1
		zz = md(i) - ld(i) * ud(i-1);
		ud(i) = ud(i) / zz;
		a(i) = (a(i) - ld(i) * a(i-1)) / zz;
	end
	a(n) = (a(n) - ld(n) * a(n-1)) / (md(n) - ld(n) * ud(n-1));
	x(n) = a(n);
	for i = n-1:-1:1
		x(i) = a(i) - ud(i) * x(i + 1);
	end
	x = x';
endfunction