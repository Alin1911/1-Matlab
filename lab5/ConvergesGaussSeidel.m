%ConvergesGaussSeidel
function [success] = ConvergesGaussSeidel(A)
    D = diag(A);
    L = tril(A);
    U = triu(A);
    N = D-L;
    P = U;
    G = N-P
    spectral_radius = max(abs(eig(G)))
    if spectral_radius < 1 
      success = true;
     else success = false;
     endif
endfunction

% Testa?i implementarea
%[success] = ConvergesGaussSeidel([1 5 -3; 6 10 2; -1 7 8])