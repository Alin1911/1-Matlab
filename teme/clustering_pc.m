function [centroids] = clustering_pc(points, NC)
  [m n] =size (points);
  q = 1;

  %calculam centroizi initiali
  %notez pentru fiecare centroid punctul care ii apartine
  for i = 1:NC
    for j = i:NC:m
       cluster(i,q) = j;
       q = q + 1;
    endfor
    q = 1;
  endfor
  %fac suma punctelor ce apartin centroidului
  %si impart la numarul punctelor din centroid
  a = zeros (NC, n);
  for i = 1:NC
    for j = 1:(m/NC)
      for p = 1:n
        a(i,p) = points(cluster(i,j),p)/(m/NC) + a(i,p);
      endfor      
    endfor
  endfor
  centroids = a;
 
  %salvez centroizii
  last = centroids;

  %aflam distanta dinte centroizi si puncte
  b = 0;
  z = zeros (NC+2, m);
  for s = 1:NC
    for i = 1:m
      for j = 1:n
        b = b + (centroids(s,j)-points(i,j))^2;
      endfor
    z(s,i) = sqrt (b);
    b = 0;  
    endfor
  endfor

  %pentru fiecare punct aflam centroidul de care apartine
  for i = 1:m
    z(NC+1,i) = 1;
    min = z(1,i);
    for j = 1:NC
      if z(j,i) < min
        min = z(j,i);
        z(NC + 1,i) = j;
      endif  
    endfor
  endfor

  %aflam cate puncte are fiecare centroid
  marime = zeros(1, NC);
  for j = 1:NC
    for i = 1:m
      if z(NC + 1,i) == j
        marime(j)++;
      endif
    endfor
  endfor

  %calculam centroidul adunand punctele sale si
  %impartind la numarul lor
  a = zeros (NC, n);
  for j = 1:NC
    for i = 1:m
      if z(NC+1,i) == j
        for p = 1:n
          a(j,p) = points(i,p)/marime(j) + a(j,p);
        endfor         
      endif
    endfor
  endfor
  centroids = a;

  %repetam pana cand centroizii nu se mai modifica
  while norm (centroids-last, inf) > 1e-6
    
    %salvez centroizii
    last = centroids;
    b = 0;

    %aflam distanta dinte centroizi si puncte
    for s = 1:NC
      for i = 1:m
        for j = 1:n
          b = b + (centroids(s,j) - points(i,j))^2;
        endfor
      z(s,i) = sqrt (b);
      b = 0;  
      endfor
    endfor
    
    %pentru fiecare punct aflam centroidul de care apartine
    for i = 1:m
      z(NC+1,i) = 1;
      min = z(1,i);
      for j = 1:NC
        if z(j,i) < min
          min = z(j,i);
          z(NC+1,i) = j;
        endif  
      endfor
    endfor
    
    %aflam cate puncte are fiecare centroid
    marime = zeros (1, NC);
    for j = 1:NC
      for i = 1:m
        if z(NC+1,i) == j
          marime(j)++;
        endif
      endfor
    endfor

  	%calculam centroidul adunand punctele sale si
  	%impartind la numarul lor
	a = zeros (NC, n);
    for j = 1:NC
      for i = 1:m
        if z(NC+1,i) == j
          for p = 1:n
            a(j,p) = points(i,p)/marime(j) + a(j,p);
          endfor         
        endif
      endfor
    endfor
 
    centroids = a;  
  endwhile
  
endfunction
