function [x_, k] = NewtonConst(grad, d2f, e, x, gk)
disp("NewtonConstant");
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
     dk = (- inv(d2f(x_(1, k), x_(2, k)))) * grad(x_(1, k), x_(2, k));
     x_(:, k + 1) = x_(:, k) + gk * dk;
     df(:, k + 1) = grad(x_(1, k + 1), x_(2, k + 1));
     k = k + 1;
     
     if k > 500
        disp("Ο αλγόριθμος δεν συγκλίνει");
        break;
    end
 end
 end
 
 function [var] = positiveDefiniteCheck(matrix)
 if matrix(1, 1) > 0 && matrix(1, 1) * matrix(2, 2)- matrix(1, 2) * matrix(2, 1) > 0 
         var = 1;
     else
         var = 0;
 end 
end
