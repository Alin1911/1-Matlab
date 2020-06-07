function [Q R s] = givens(A, b)
	[m n] = size(A);
	Q = eye(m);
	for k = 1 : n
		for l = k+1 : m
            r = sqrt(A(k,k)^2 + A(l,k)^2);
            c = A(k,k)/r;
            s = -A(l,k)/r;
            
            t = c*A(k,k:n) - s*A(l,k:n);
            A(l,k:n) = s*A(k,k:n) + c*A(l,k:n);
            A(k,k:n) = t;
            
            u = c*b(k) - s*b(l);
            b(l) = s*b(k) + c*b(l);
            b(k) = u;
            
            t = c*Q(k,1:m) - s*Q(l,1:m);
            Q(l,1:m) = s*Q(k,1:m) + c*Q(l,1:m);
            Q(k,1:m) = t;
            
        endfor
    endfor
	Q = Q';
    R = A;
endfunction
