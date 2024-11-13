function[ak, bk, n] = bisectionDer(a, b, l, f)
ak = a;
bk = b;
k = 1;
n = 0;
x = zeros(1);
    
while (1/2)^n > l/(bk - ak)
        n = n + 1;
end

disp("n equals " + n);
while k ~= n
    x(k) = (ak(k)+ bk(k))/2;
        subs(f, x(k));
     
        if subs(f, x(k)) > 0
                disp("case 1");
                ak(k + 1) = ak(k);
                bk(k + 1) = x(k);
                k = k + 1;
                
        
        elseif subs(f, x(k)) < 0
                disp("case 2");
                ak(k + 1) = x(k);
                bk(k + 1) = bk(k);
                k = k + 1;
                
        elseif subs(f, x(k)) == 0
            disp("case 0");
            k = n;
        end
end
end
