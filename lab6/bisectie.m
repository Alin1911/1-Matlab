function [sol] = bisectie(f, a, b, tol)
    if f(a)*f(b) > 0
        exit(1)
    end
    x_M = (a + b)/2.0;
    f_M = f(x_M);
    while abs(f_M) > tol
        left_f = f(a);
        right_f = f(b);
        if left_f*f_M > 0   
            a = x_M;
        else
            b = x_M;
        end
        x_M = (a + b)/2;
        f_M = f(x_M);
    end
    sol = x_M;
end