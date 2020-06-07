function x = Simpson(a, b, n) 
h = (b - a) / (2 * n);
s1 = 0;
for i = 1 : n
	s1 = s1 + (a+(2*i-1)*h)*(log(a+(2*i-1)*h));
endfor

s2 = 0;
for i = 1 : n-1
	s2 = s2 + (a+2*i*h)*(log(a+2*i*h));
endfor
x = h*(a*log(a) + b*log(b) + 4*s1 + 2*s2)/3;
endfunction
