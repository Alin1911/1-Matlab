function [y] = pro1(x0)
	h=0.0001;
	y=( sin(x0 + h) - sin(x0))/h;
end

