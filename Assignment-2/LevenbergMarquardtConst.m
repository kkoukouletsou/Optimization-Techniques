function [x_, k] = LevenbergMarquardtConst(f, grad, d2f, x, e, gk)
disp("Levenberg Marquardt Constant");
k = 1;
x_(:, 1) = x;
df(:, k) = grad(x_(1, k), x_(2, k));

I = eye(2);
mk = 0;
matrix = d2f(x_(1, k), x_(2, k));

b = 0;
b1 = 0;
a = 0;

while norm(df(:, k)) > e
    
    disp("k = " + k);
    var = positiveDefiniteCheck(matrix);
    while var == 0
        mk = mk + 1;
        matrix = d2f(x_(1, k), x_(2, k)) + mk .* I;
        var = positiveDefiniteCheck(matrix);
    end
    
    dk = - inv(matrix) * grad(x_(1, k), x_(2, k)); 
    x_(:, k + 1) = x_(:, k) + gk .* dk;
    df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
 
    %criteria 3
    while b < 1
        if transpose(dk) * (df(:, k + 1) - b * df(:, k)) > 0
            var2 = 1;
            b1 = b;
        else
            var2 = 0;
        end
        b = b + 0.01;
    end
    %criteria 4
    while a < b1
        if f(x_(1, k + 1), x_(2, k + 1)) - f(x_(1, k), x_(2, k)) <= a * gk *transpose(dk) * df(:, k)
            var3 = 1;
        else 
            var3 = 0;
        end
        a = a + 0.01;
    end
    if var2 == 0 || var3 == 0
        x_(:, k + 1) = x_(:, k);
        disp("Το κριτηριο δεν ικανοποιείται");
        break;
    end
    
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