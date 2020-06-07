function x = trapez(a, b, n) 
h = (b - a) / n;
s = 0;
for i = 1:n-1
	s = s + log(1+(a + i * h)^2);
endfor
x = h * (log(1+a^2) + log(1+b^2) + 2 * s) / 2;
endfunction
