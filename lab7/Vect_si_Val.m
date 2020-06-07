function [val vect] = Vect_si_Val (A)
  val= roots ( poly (A) );
  [vect,V] = eig(A);
endfunction
