function result =tangenta(x0,f,derivata_ecuatie,tol)
    x = x0;
    while abs(f(x)) > tol
        x = x - f(x)/derivata_ecuatie(x);
    end
    result = x;
end