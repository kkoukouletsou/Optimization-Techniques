function [x_, k] = NewtonMinimum(f, grad, d2f, e, x)
syms gk;
disp("Newton Minimum");
k = 1;
x_(:, 1) = x;
df(:, k) = grad(x_(1, k), x_(2, k));


while norm(df(:, k)) > e
    var = positiveDefiniteCheck(d2f(x_(1, k), x_(2, k)));
    if var == 0
        disp("Matrix is not positive definite");
        break;
    end
   
    disp("k = " + k);
    dk = - inv(d2f(x_(1, k), x_(2, k))) * grad(x_(1, k), x_(2, k));
    func = @(gk) f(x_(1, k) - gk * df(1, k), x_(2, k) - gk * df(2, k));
    gk = find_gk(func);
    x_(:, k + 1) = x_(:, k) + gk * dk;
    df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
    k = k + 1;
    
    if k >= 500
        disp("Ο αλγόριθμος δεν συγκλίνει");
        break;
    end
end
end

function [var2] = positiveDefiniteCheck(matrix)

if matrix(1, 1) > 0 && matrix(1, 1)*matrix(2, 2)- matrix(1, 2)*matrix(2,1 )> 0 
        var2 = 1;
    else
        var2 = 0;
end 
end


function [gk1] = find_gk(f)

a = 0.01;
b = 4;
l = 0.001;
e = 0.0001;

while b - a >= l
    x1 = ( a + b ) / 2 - e;
    x2 = ( a + b ) / 2 + e;
    if subs(f, x1) < subs(f, x2)
        b = x2;
    else
        a = x1;
    end
end
gk1 = (a + b)/2;
end
