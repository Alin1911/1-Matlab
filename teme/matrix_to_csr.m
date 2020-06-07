function [values, colind, rowptr] = matrix_to_csr(A)
	[n m] = size (A);
	nz = 0;
	z = 1;
	%parcurg matricea
	for i = 1:n
		for j = 1:m
			%elemente nenule primul de pe linie 
			%il pun in rowptr si ies
			if A(i,j) ~= 0
				nz = nz+1;
				values(nz) = A(i,j);
				colind(nz) = j;
				rowptr(i) = nz;
				break;
			endif
		endfor
		%continui sa caut elemente pe acea linie
		j = j + 1;
		for j = j:m
			if A(i,j) ~= 0
				nz = nz + 1;
				values(nz) = A(i,j);
				colind(nz) = j;
			endif
		endfor
	endfor
	%ultimul element
	rowptr(n + 1) = nz + 1;
endfunction