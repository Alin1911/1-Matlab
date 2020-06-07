function [sol] = rgbHistogram(path_to_image, count_bins)

  %citim matricile imaginii
  X = imread (path_to_image);
  R = X(:,:,1);
  V = X(:,:,2);
  A = X(:,:,3);
  %calculam intervalele
  ind = 256 / count_bins;
  c = zeros (1, ind + 1);
  c(1) = 0;
  if count_bins != 16
  	for i = 2:count_bins + 1;
      c(i) = c(i - 1) + ind;	
 	endfor
 	c(16) = c(16) - 1;	
  else
  	for i = 2:count_bins + 1;
      c(i) = c(i - 1) + ind;	
 	endfor
  endif

  %calculam matricele pentru aflarea intervalelor
  Al = histc (A, c);
  Ve = histc (V, c);
  Ro = histc (R, c);
  [m n] = size (Al);
  
  %pentru rosu aflam numerele din intervale
  ros = zeros (1, count_bins); 
  for i = 1:count_bins
    ros(i) = sum (Ro(i,:));
  endfor

  %pentru verde aflam numerele din intervale
  verd = zeros(1, count_bins); 
  for i = 1:count_bins
    verd(i) = sum (Ve(i,:));
  endfor

  %pentru albastru aflam numerele din intervale
  alb = zeros (1, count_bins); 
  for i = 1:count_bins
    alb(i) = sum (Al(i,:));
  endfor

  %punem cele trei rezultate in vectorul sol
  for i = 1:count_bins
    sol(i) = ros(i);
  endfor 
  
    j = 1;
  for i = i + 1:(2 * count_bins)
    sol(i) = verd(j);
    j++;
  endfor
  
  j = 1;
  for i = i + 1:(3 * count_bins)
    sol(i) = alb(j);
    j++;

    endfor
end