function [x_, k] = NewtonArmijo(f, grad, d2f, e, x)
disp("Newton Armijo");
k = 1;
df(:, k) = grad(x(1), x(2));
x_ = zeros(2, k);
x_(:, 1) = x;

a = 10^(-4);
b = 0.5;
s = 0.5;
min = (inf);

while norm(df(:, k)) > e
    var = positiveDefiniteCheck(d2f(x_(1, k), x_(2, k)));
    if var == 0
        disp("Matrix is not positive definite");
        break;
    end
    
    disp("k = " + k);
    dk = - inv(d2f(x_(1, k), x_(2, k))) * grad(x_(1, k), x_(2, k));
    
    for m = 1: 10
        gk = s * b^m;
        x_(:, k + 1) = x_(:, k) + gk * dk;
        
        if f(x_(1, k), x_(2, k)) - f(x_(1, k+1), x_(2, k+1)) >= - a * b^m * s * transpose(dk) * grad(x_(1, k), x_(2, k))
            if m < min
                min = m;
            end
        end
    end
    
    gk = s * b ^ min;
    x_(:, k + 1) = x_(:, k) + (gk .* dk);
    df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
    
    k = k + 1;
    if k > 1000
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