function cauta(file,s)
  fid=fopen(file,'r');
  linie=fgetl(fid); 
  b=0;  
  while (linie != -1)    
    disp(linie);
    a=length(strfind(linie,s));
    b=b + length(strfind(linie,s));
    linie=fgetl(fid);
    disp(a);
  endwhile
  disp(b);
  fclose(fid);
   
endfunction
