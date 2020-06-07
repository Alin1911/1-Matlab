function [lambda,y,iter] = PutereInv(A,y,lambda,maxIter,esp)
	iter = 1;
	[n m] = size(A);
	while iter<=maxIter
		z = inv(A-lambda*eye(n))*y;
		y = z/norm(z);
		z = A*y;
		lambda = y'*z; 
		e = norm(z-lambda*y);
		if e >= esp
			iter = iter+1;
		else
			x = y;
			break;
		end
	end