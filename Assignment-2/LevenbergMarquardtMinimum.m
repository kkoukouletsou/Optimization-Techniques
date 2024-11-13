function [x_, k] = LevenbergMarquardtMinimum(f, grad, d2f, x, e)
disp("Levenberg Marquardt Minimum");
k = 1;
x_(:, 1) = x;
df(:, k) = grad(x_(1, k), x_(2, k));

I = eye(2);
mk = 0;
matrix = d2f(x_(1, k), x_(2, k));
b1 = 0;

while norm(df(:, k)) > e
    disp("k = " + k);
    
    var = positiveDefiniteCheck(matrix);
    while var == 0
        mk = mk + 1;
        matrix = d2f(x_(1, k), x_(2, k)) + mk .* I;
        var = positiveDefiniteCheck(matrix);
    end
    
    dk = - inv(matrix) * grad(x_(1, k), x_(2, k)); 
    func = @(gk) f(x_(1, k) - gk * df(1, k), x_(2, k) - gk * df(2, k));
    gk = find_gk(func);
    x_(:, k + 1) = x_(:, k) + gk .* dk;
    df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
    %criteria 3
    for b = linspace(0, 1)
        if transpose(dk) * (df(:, k + 1) - b * df(:, k)) > 0 && b >0
            var2 = 1;
            b1 = b;
        else
            var2 = 0;
        end
    end
    %criteria 4
    for a = linspace(0, b1)
        if f(x_(1, k + 1), x_(2, k + 1)) - f(x_(1, k), x_(2, k)) <= a * gk *transpose(dk) * df(:, k) && a > 0
            var3 = 1;
        else 
            var3 = 0;
        end
    end
        
     if var2 == 0 || var3 == 0
        x_(:, k + 1) = x_(:, k);
        disp("Το κριτηριο δεν ικανοποιείται");
        break;
    end
    
    x_(:, k + 1) = x_(:, k) + gk .* dk;
    df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
    matrix = d2f(x_(1, k + 1), x_(2, k + 1));                
    k = k + 1;
    
    if k >= 500
        disp("Ο αλγόριθμος δεν συγκλίνει");
        break;
    end
end
end

 function [var] = positiveDefiniteCheck(matrix)
 if matrix(1, 1) > 0 && matrix(1, 1) * matrix(2, 2) - matrix(1, 2) * matrix(2, 1) > 0 
         var = 1;
     else
         var = 0;
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