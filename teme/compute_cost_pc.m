function [cost] = compute_cost_pc (points, centroids)
  [NC n] = size (centroids);
  [m n] = size (points);
  z = zeros (NC+2, m);
  b = 0;
  cost = 0;
  %calculam distantele in matricea z;
  for s = 1:NC
    for i = 1:m
      for j = 1:n
        b = b + (centroids(s,j) - points(i,j))^2;
      endfor
    z(s,i) = sqrt (b);
    b = 0;  
    endfor
  endfor
  %aflam distanta minima si centroidul aferent ei coloana 
  for i = 1:m
    z(NC + 1,i) = 1;
    min1 = z(1,i);
    for j = 1:NC
      if z(j,i) <= min1
        min1 = z(j,i);
        z(NC + 1,i) = j;  %centroidul
        z(NC + 2,i) = z(j,i); %distanta
      endif  
    endfor
  endfor
  %adunam distantele pentru a afla costul
  costi = zeros (1, NC);
  for j = 1:NC
    for i = 1:m
      if j == z(NC+1,i)
        costi(j) = costi(j) + z(NC+2,i); 
      endif
    endfor
  endfor
  %costul final
  cost = sum(costi);
endfunction

