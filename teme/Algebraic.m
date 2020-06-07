function R = Algebraic(nume, d)
%deschidem fisierul
  file = fopen (nume, 'r+');

  %citim numarul de nodurii
  N = fscanf (file, '%f', 1);

  %initializam matricea de adiacenta cu zerourii
  A = zeros (N);

  %citim muchiile
  for i = 1:N
    %citim numarul liniei(nodului)
    lin = fscanf (file, '%f', 1);

    %citim numarul de muchii al nodului
    nr = fscanf (file, '%f', 1);

    %citim toate muchiile nodului
    muchii = fscanf (file, "%d", nr);

    %punem muchiile in matricea de adiacente pe lina corespunzatoare
    A(i, muchii) = 1;    
  end

    %aici am un for care calculeaza mia multe:
  for i = 1:N
    %calculam inversa matricei K
    inv_K(i, i) = 1 / sum (A(i, :));

    %vector de 1;
	  C1(i,1) = 1;
  endfor

  %calculam M cu formula
  M = (inv_K * A)';
  %I matrice identitate de ordinul N
  I = eye(N); 
  %calculam R
  R = inv(I-d*M) * (1-d)/N * C1;  
  
endfunction