function sol_tip(x)
  c = imag(x);
  [a b] = size(x);
  for i = 1:a
    if x(i) > 0 && c(i) == 0
      disp ("numarul"), disp (x(i)), disp("real pozitiv");
  elseif x(i) < 0 && c(i) == 0
      disp ("Numarul"), disp (x(i)), disp("real negativ");
  elseif x(i) == 0 && c(i) == 0
      disp ("Numarul"), disp (x(i))
  else
      disp ("Numele "), disp (x(i)), disp("imaginar");
  endif
  endfor
endfunction