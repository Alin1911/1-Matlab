function [X]=QR_cu_deplasare(A,tol,maxiter)
  [m,n]=size(A);
  II=eye(n);
  v=zeros(m,m);
  for k=1:m-2
    x=A(k+1:m,k);
    if x(1)>=0
      int2=1;
    else
      int2=-1;
    end
    al=int2*norm(x,2)*[1;zeros(length(x)-1,1)]+x;
    al=al/norm(al);
    A(k+1:m,k:m)=A(k+1:m,k:m)-2*al*(al'*A(k+1:m,k:m));
    A(1:m,k+1:m)=A(1:m,k+1:m)-2*(A(1:m,k+1:m)*al)*al';
    v(k+1:m,k)=al;
  end
  it=0;
  H=A;
  while norm(diag(H,-1),inf) > tol && it<maxiter
    m = H(n,n);
    [m,n]=size(H);
    Q=eye(m,n);
    for k=2:n
      a=H(k-1:k,k-1);
      an=sqrt(a'*a);               
      c=sign(a(2))*abs(a(1))/an;   
      s=sign(a(1))*abs(a(2))/an;   
      Sc=eye(n);
      Sc(k-1,k-1)=c; Sc(k,k)=c;
      Sc(k-1,k)=s; Sc(k,k-1)=-s;
      H=Sc*H;
      Q=Q*Sc';
    end
    HH=H*Q;
    H=HH;
    it=it+1;
  end
  X=diag(H);
endfunction