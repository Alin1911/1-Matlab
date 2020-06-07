function y = SIT(A, b)
  [n, m] = size(A);
  y = zeros(n, 1);
  for i = 1 : n
    s = 0;
    for j = 1 : (i - 1)
      s += (A(i,j) * y(j));
    endfor
    y(i) = (b(i) - s) / A(i,i);
  endfor
endfunction