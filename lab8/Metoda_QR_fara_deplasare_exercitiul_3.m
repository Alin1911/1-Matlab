function [X] = Metoda_QR_fara_deplasare_exercitiul_3(A, tol, maxiter)
  A0 = A;
for i = 1:maxiter
  [Q R] = qr(A0);
  A = R * Q;
  X = A;
  if norm(diag(A) - diag(A0)) < tol
    return;
  endif
  A0 = A;
  endfor
end