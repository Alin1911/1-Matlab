function P = Casteljau(x, y, t)
	n = length(x);
	plot(x, y, 'k-o');
	hold on;
	axis([0.5, 4.5, 0.2, 2.1]);
  xi = x;
  yi = y;
  for k = 1 : n
    for i = 1 : n-k
      yi(i) = yi(i+1)*t + yi(i)*(1-t);
      xi(i) = xi(i+1)*t + xi(i)*(1-t);
    endfor
  endfor
  P(1) = xi(1);
  P(2) = yi(1);
endfunction