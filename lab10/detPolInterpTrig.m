function C = detPolInterpTrig (m, y)
  C = zeros(m,1);
  for k = 1:m
    s1=0;
    s2=0;
    for i = 1:m
      s1 = s1 + (y(2*i-1))*e^(2*(1i)*(k-1)*pi*(i-1)/m);
      s2 = s2 + (y(2*i))*e^(2*(1i)*(k-1)*pi*(i-1)/m);
    end
    s1=s1*2;
    s2=s2*2*e^((1i)*(k-1)*pi/m);
    C(k)=(s1+s2)/2;
    C(k+m)=(s1-s2)/2;
  end
endfunction
