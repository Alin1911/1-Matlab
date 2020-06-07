function B=inv(A)
  [n,n]=size(A);
  A1=A(1:3,1:3)
  A3=A(1:3,4)
  A2=A(4,1:3)
  A4=A(4,4)
  X1=(A1-A3*A4^-1*A2)^-1
  X2=-A4^-1*A2*X1
  X4=(A4-A2*A1^-1*A3)^-1
  X3=-A1^-1*A3*X4
  B=[X1,X3;X2,X4]
endfunction