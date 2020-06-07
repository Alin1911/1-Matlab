function [f] = f_2(x)

% f_2(x) = 0, cu x = [x(1);x(2)]

% reprezinta un sistem de ecuatii neliniare de ordinul 2x2

f1 = x(1)^2 + x(2)^2 - 50;

f2 = x(1)*x(2) -25;

f = [f1;f2];

% end function

endfunction