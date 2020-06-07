% !!! Exerci?iu punctat !!!

function [succes] = ConvergesJacobi(A)
    v=diag(A);
    D=diag(v);
    L=tril(A,-1);
    U=triu(A,1);
    %calculam N P G
    N=D ;
    P=L+U;
    G=(N^-1)*(P);
    %calculam raza spectrala
    spectral_radius=max(abs(eig(G)));
    if(spectral_radius<1)
      succes=1;
    else
      succes=0;
    endif    
endfunction 

% Testa?i implementarea
succes = ex3([1 5 -3; 6 10 2; -1 7 8])