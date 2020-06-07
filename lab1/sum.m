function sum
  a = 0;
  n = input("Introducet  variabila:")
  for i=1:1:n
    if (mod(i,2)!=0)
      a=a+i;
    endif
  endfor
  disp (a);
endfunction
