function [x_, k] = SteepestDescentArmijo(f, grad, x, e)

disp("Steepest Descent Armijo");
k = 1;
x_(:, 1) = x;
df(:, k) = grad(x_(1, k), x_(2, k));

a = 10^(-4);
b = 0.5;
s = 0.5;
min = (inf);

while norm(df(:, k)) > e
    disp("k = " + k);
    
    dk = - df(:, k);
    for m = 1: 10
        gk = s * b^m;
        x_(:, k + 1) = x_(:, k) + gk * dk;
        if f(x_(1, k), x_(2, k)) - f(x_(1, k+1), x_(2, k+1)) >= - a * b^m * s * transpose(dk) * df(:, k)
            if m < min
                min = m;
            end
        end
    end
    gk = s * b ^ min;
    x_(:, k + 1) = x_(:, k) + (gk .* dk);
    df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
    k = k + 1;
    
    if k >= 500                                           
        disp("Ο αλγόριθμος δεν συγκλίνει");
        break;
    end
end
end