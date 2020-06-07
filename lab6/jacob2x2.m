function [J] = jacob2x2(x)

% functie care evalueaza Jacobian-ul unui sistem de ecuatii neliniare de ordinul 2x2

J(1,1) = 2*x(1); J(1,2) = 2*x(2);

J(2,1) = x(2); J(2,2) = x(1);

% end function

endfunction