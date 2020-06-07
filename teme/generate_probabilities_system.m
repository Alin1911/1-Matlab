function [A, b] = generate_probabilities_system (rows)
 	m = 0;
 	j = 1;
 	q = 0;

 	%calculez ultimul element si initializez matricea
  	for i = 1:rows
    	m = m + i;
  	endfor
  	A = eye (m);

  	%parcurg liniile triunghiului 
  	for i = 1:rows
    	q = q + i; %capatul liniei "i"
    	%parcurg de la inceput de linie pana la final
    	for j = j:q 
      		if (j == 1 || j == m || j == m-i+1) 
      			%colturii
        		%vecinii pentru colturii
        		
        		A(j,j) = 4;
				if (j == 1)
					A(j,j + 1) = -1;
					A(j,j + 2) = -1;
				endif
				if (j == m)
					A(j,j - 1) = -1;
					A(j,j - i) = -1;
				endif
				if (j == m-i+1)
					A(j,j - i + 1) = -1;
					A(j,j + 1) = -1;
				endif
      		elseif (q == j || j == q-i+1 || i == rows) 
      			%margini
      			%vecinii pentru fiecare latura a matricei

       			A(j,j) = 5;
				if (j == q)
					A(j,j - i) = -1;
					A(j,j - 1) = -1;
					A(j,j + i) = -1;
					A(j,j + i + 1) = -1;
				endif
				if (j == q-i+1)
		  			A(j,j + 1) = -1;
					A(j,j - i + 1) = -1;
					A(j,j + i) = -1;
					A(j,j + i + 1) = -1;
				endif
				if (i == rows)
					A(j,j - 1) = -1;
					A(j,j + 1) = -1;
					A(j,j - i) = -1;
					A(j,j - i + 1) = -1;
				endif
      		else  
      			%elemente in centru
      			%vecinii ementelor din centru

      			A(j,j) = 6;
				A(j,j - 1) = -1;
				A(j,j + 1) = -1;
				A(j,j - i) = -1;
				A(j,j - i + 1) = -1;
				A(j,j + i) = -1;
				A(j,j + i + 1) = -1; 
      		endif    
    	endfor
    	j = j + 1;
	endfor
	%calculez vectorul b
	for i = 1:m - rows
		b(i) = 0;
	endfor
	for i = m - rows + 1:m
		b(i) = 1;
	endfor
	b = b';
endfunction