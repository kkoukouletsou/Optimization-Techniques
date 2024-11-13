function [ak, bk, k] = bisection(a, b, f, l, e)

k = 1;
ak = a;
bk = b;

x1k = zeros(1);
x2k = zeros(1);

while bk(k) - ak(k) >= l
    x1k(k) = (ak(k) + bk(k))/2 - e;
    x2k(k) = (ak(k) + bk(k))/2 + e;
    if subs(f,x1k(k))<subs(f,x2k(k))
        ak(k + 1) = ak(k);
        bk(k + 1) = x2k(k);
        k = k + 1;
    else
        ak(k + 1) = x1k(k);
        bk(k + 1) = bk(k);
        k = k + 1;
    end
end
end