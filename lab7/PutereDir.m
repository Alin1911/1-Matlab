function [lambda,y,iter] = PutereDir(A,y,maxIter,esp)
	iter = 0;
	while iter<=maxIter
		q = y/norm(y);
		z = A*q;
		lambda = q'*z;
		e = norm(z-lambda*q);
		if e >= esp
			iter = iter+1;
			y = z;
		else
			x = q;
			break;
		end
		x = q;
  end
  y=x;
end