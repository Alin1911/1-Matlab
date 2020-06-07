function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
	[m n] = size (G_rowptr);
	%initializez x0

	x0 = zeros (1, n-1);
	%calculez x

	x = csr_multiplication (G_values, G_colind, G_rowptr, x0) + c;
	%repet pana cand se atinge toleranta 

	while ( norm(x - x0) >= tol)
		x0 = x;
		x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;
	endwhile
endfunction