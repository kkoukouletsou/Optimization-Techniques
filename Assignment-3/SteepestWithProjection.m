function [x1_, x2_, k] = SteepestWithProjection(df, sk, gk, e, x, c1, c2)
syms x1 x2
k = 1;
x1_= zeros(1);
x2_ = zeros(1);
x1_(k) = x(1);
x2_(k) = x(2);
x1bar = zeros(1);
x2bar = zeros(1);
var1 = zeros(1);
var2 = zeros(1);

while double(norm(subs(df, {x1, x2}, {x1_(k), x2_(k)}))) > e
        
    %calculate projection
    var1(k) = x1_(k) - sk .* subs(df(1, :), x1_(k));
    var2(k) = x2_(k) - sk .* subs(df(2, :), x2_(k));    
        
    if var1(k) < c1(1)
        x1bar(k) = c1(1);
    elseif var1(k) > c1(2)
        x1bar(k) = c1(2);
    else 
        x1bar(k) = var1(k);
    end
    
    if var2(k) < c2(1)
        x2bar(k) = c2(1);
    elseif var2(k) > c2(2)
        x2bar(k) = c2(2);
    else 
        x2bar(k) = var2(k);
    end
    
    x1_(k + 1) = x1_(k) + gk * (x1bar(k) - x1_(k));
    x2_(k + 1) = x2_(k) + gk * (x2bar(k) - x2_(k));
    k = k + 1;
    disp("k = " + k);

    if k > 3000
        disp("Ο αλγόριθμος δεν συγκλίνει");
        break
    end
end
end