function x = jacobi(A, b, x0, eps, maxiter)


[n n] = size(A);
D = L = U = zeros(n, n);

%mai intai, se afla matricile D, L, U

%matricea D este formata din elementele de pe diagonala principala
for i = 1:n
	D(i, i) = A(i, i);
endfor

%matricea U este formata din elementele de deasupra diagonalei principale ale matricei A (luate cu semn schimbat) si o in rest
for i = 1:n
	for j = i+1:n
		U(i, j) = -A(i, j);
	endfor
endfor

%matricea L este formata din elementele de sub diagonala principala a matricei A, luate cu semn schimbat si 0 in rest
for i = 1:n
	for j = 1:i - 1
		L(i, j) = -A(i, j);
	endfor
endfor

%conforma metodei Jacobi, N = D, P = L + U

N = D;
P = L + U;

N1 = inv( N);
G = N1 * P;
c = N1 * b;

iter = 0;
x = G * x0 + c; %se calculeaza un x in afara ciclului 

while (iter <= maxiter && ( norm( A * x - b ) >= eps))
	iter = iter + 1;
	x = G * x + c;
	x0 = x; %in x0 se retine acel x calculat la pasul anterior
endwhile

endfunction