function [vp, sigma, beta] = GetHSReflector(x, p)
m = length(x);

sigma = sign(x(p)) * norm(x(p:end));
vp(p) = x(p) + sigma;
beta = sigma * vp;
vp(1:p-1) = 0;
vp(p+1:m) = x(p+1:m); 
vp = vp(:);
endfunction