function x =endpoint(x0)
  	h = 0.0001;
    	x = (1 / (2 * h)) * (-3 * e^(3*x0) + 4 * e^(3*(x0 + h)) - e^(3*(x0 + 2 * h)));
end

