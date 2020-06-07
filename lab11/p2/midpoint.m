function x = midpoint(x0)
	h = 0.0001;
	x = (1 / (2 * h)) * (e^(3*(x0 + h)) - e^(3*(x0 - h)));
end
