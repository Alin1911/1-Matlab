function dimensiune(file)
  fid = fopen(file,'r');
  fseek(fid,0,SEEK_END);
  c=ftell(fid);
  disp(c);
  fclose(fid);
endfunction