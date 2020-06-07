function x = ApplyHSToPColumn(x, p, sigma)

x(p+1:end) = 0;
x(p) = -sigma;

endfunction