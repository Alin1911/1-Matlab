function r = lab12Pr1(f,a,b,N)
  h = (b - a) ./ (2.^(0:N-1));
  r(1,1) = (b - a) * (f(a) + f(b)) / 2;
  for j = 2:N
    subtotal = 0;
    for i = 1:2^(j-2)
        subtotal = subtotal + f(a + (2 * i - 1) * h(j));
    end
    r(j,1) = r(j-1,1) / 2 + h(j) * subtotal;
    for k = 2:j
        r(j,k) = (4^(k-1) * r(j,k-1) - r(j-1,k-1)) / (4^(k-1) - 1);
    end
  end
end