function [A b] = GPPS(A, b)
  [n n] = size(A);
  
  for p = 1 : n -1
    pivot = -inf;
    linie_pivot = -1;
    
    for i = 1: n 
      s(i) = 0;
      for j = p : n
        s(i) = s(i) + abs(A(i, j));
      endfor
    endfor
    for i = p: n
      if pivot/s(i) < abs(A(i, p))/ s(i);
        pivot = abs(A(i, p));
        linie_pivot = i;
      endif
    endfor
    
    if p ~= linie_pivot
      for j = p : n
        t = A(p, j);
        A(p, j) = A(linie_pivot, j);
        A(linie_pivot,j) = t;
      endfor
      
      t = b(linie_pivot);
      b(linie_pivot) = b(p);
      b(p) = t;
    endif
    
    for i = p + 1 : n
      if A(p, p) == 0
        continue;
      endif
      tp = A(i, p)/A(p,p);
      A(i, p) = 0;
      for j = p + 1 : n
        A(i , j) = A(i , j) - tp*A(p, j);
      endfor
      
      b(i) = b(i) - tp * b(p);
    endfor
  endfor
endfunction

A =[5.2 7.1; 2.4 3.2]
b= [19.8; 4.1]
[A1 b1]=GPPS(A,b)
A1\b1