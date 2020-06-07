function functia
  fid = fopen('valori.txt','w');
  for i=0:0.1:1
    c=2*i+1;
    fprintf(fid,'%f\n',c);
  endfor
  fclose(fid);
endfunction