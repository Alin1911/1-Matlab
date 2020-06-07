function [Q, R] = Householder(A)
	[m,n] = size(A);
	if m>=n,
    	NumberOfReflections = n;
	else
    	NumberOfReflections = m-1;
	end
	R = A;
	Q = cell(NumberOfReflections,1);
	for k = 1:NumberOfReflections,
    	x = R(k:m,k);
    	xnorm = norm(x);
    	if xnorm>0,
        	Q{k} = -x;
        	Q{k}(1) = Q{k}(1) - sign(x(1))*xnorm;
        	Q{k} = (sqrt(2)/norm(Q{k}))*Q{k};
        	for j = k:NumberOfReflections,
                R(k:m,j) = R(k:m,j) - (Q{k}*R(k:m,j))*Q{k};
        	endfor
    	else
        	Q{k} = zeros(m-k+1,1);
    	endif
    endfor
endfunction