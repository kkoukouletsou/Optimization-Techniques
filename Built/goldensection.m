function [ak, bk, k] = goldensection(a, b, l, f)
ak = a;
bk = b;
g = 0.618;
x1k = zeros(1);
x2k = zeros(1);
x1k(1) = ak(1) + (1 - g)*(bk(1) - ak(1));
x2k(1) = ak(1) + g * (bk(1) - ak(1));
k = 1;
while bk(k) - ak(k) >= l
    if subs(f, x1k(k)) > subs(f, x2k(k))
        ak(k + 1) = x1k(k);
        bk(k + 1) = bk(k);
        x1k(k + 1) = x2k(k);
        x2k(k + 1) = ak(k + 1) + g * (bk(k + 1) - ak(k + 1));
    elseif subs(f, x1k(k)) < subs(f, x2k(k))
        ak(k + 1) = ak(k);    
        bk(k + 1) = x2k(k);
        x1k(k + 1) = ak(k + 1) + (1 - g)*(bk(k + 1) - ak(k + 1));
        x2k(k + 1) = x1k(k);
    end
        k = k + 1;
end
end