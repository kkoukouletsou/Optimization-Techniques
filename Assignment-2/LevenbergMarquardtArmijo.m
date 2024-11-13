function [x_, k] = LevenbergMarquardtArmijo(f, grad, d2f, x, e)
disp("Levenberg Marquardt Armijo");
k = 1;
x_(:, 1) = x;
df(:, k) = grad(x_(1, k), x_(2, k));

a = 10^(-4);
b = 0.5;
s = 0.5;
min = (inf);

I = eye(2);
mk = 0;
matrix = d2f(x_(1, k), x_(2, k));

while norm(df(:, k)) > e
    disp("k = " + k);
    
    var2 = 0;
    var = positiveDefiniteCheck(matrix);
    while var == 0
        mk = mk + 1;
        matrix = d2f(x_(1, k), x_(2, k)) + mk .* I;
        var = positiveDefiniteCheck(matrix);
    end
    
    dk = - inv(matrix) * grad(x_(1, k), x_(2, k)); 

    for m = 0: 15
        gk = s * b^m;
        x_(:, k + 1) = x_(:, k) + gk * dk;
        if f(x_(1, k), x_(2, k)) - f(x_(1, k+1), x_(2, k+1)) >= - a * b^m * s * transpose(dk) * grad(x_(1, k), x_(2, k))
            if m < min
                df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
                for b = linspace(0, 1)
                    if transpose(dk) * (df(:, k + 1) - b * df(:, k)) > 0 && b >0
                        var2 = 1;
                        min = m;
                    end
                end
            end            
        end
    end
    
     if var2 == 0 
         x_(:, k + 1) = x_(:, k);
         disp("Το κριτήριο δεν ικανοποιείται");
         break;
     else
        gk = s * b ^ min;
        x_(:, k + 1) = x_(:, k) + gk .* dk;
        df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
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