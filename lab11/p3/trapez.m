function x = trapez(a, b, n) 
h = (b - a) / n;
s = 0;
for i = 1:n-1
	s = s + e^(3*(a + i * h));
endfor
x = h * (e^(3*a) + e^(3*b) + 2 * s) / 2;
endfunction
