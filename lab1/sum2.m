 function sum
  a = 0;
  n = input("Introducet  variabila:")
  i=0;
  while i <= n
    if (mod(i,2)!=0)
      a=a+i;
    endif
    i=i+1;
    endwhile
  disp (a);
endfunction
