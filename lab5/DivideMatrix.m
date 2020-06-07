function [D, L, U] = DivideMatrix(A)
    b=diag(A);
    B0=[0;0;0];
    D=diag(b);
    L=tril(A,-1);
    U=triu(A,1);
endfunction 

% Testați implementarea
[D, L, U] = ex1([1 5 -3; 6 10 2; -1 7 8])