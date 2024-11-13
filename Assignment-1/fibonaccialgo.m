function[ak, bk, k]=fibonaccialgo(a, b, l, f)
ak = a;
bk = b;

%% Recursive Fibonacci Algorithm
    function[F]=fibb(n)
        if n == 0 || n == 1 || n == 2
            F = 1;
           
        else
            F = fibb(n - 1) + fibb(n - 2);
          
        end
    end


%% Finding Value of n

c = (bk - ak)/l;
n1 = 0;
i = 0;
    while(0 == 0)
        if fibb(i) < c
            i = i + 1;
            continue
        elseif fibb(i) > c
            n1 = i;
            break
        end
    end
    
%% Fibbonacci Algorithm
   x1k = zeros(1);
   x2k = zeros(1);
   k = 1;
   x1k(1) = ak + (fibb(n1 - 2)/fibb(n1))*(bk(1) - ak(1));
   x2k(1) = ak + (fibb(n1 - 1)/fibb(n1))*(bk(1) - ak(1));

var =0;
    while(var == 0)
      %disp("FIRST");
        if subs(f, x1k(k)) > subs(f, x2k(k))
            %disp("SECOND");
            ak(k + 1) = x1k(k);
            bk(k + 1) = bk(k);
            x1k(k + 1) = x2k(k);
            x2k(k + 1) = ak(k + 1) + (fibb(n1 - k - 1)/fibb(n1 - k))*(bk(k + 1) - ak(k + 1));
                if k == n1 - 2 
                    var = 1;
                    %disp("LAST ONE");
                    x1k(k+2) = x1k(k + 1);
                    x2k(k+2) = x1k(k + 1) + 0.001;
                        if subs(f, x1k(k+2)) > subs(f, x2k(k+2))
                            ak(k+2) = x1k(k+2);
                            bk(k+2) = bk(k+1);
                        else 
                            ak(k+2) = ak(k+1);
                            bk(k+2) = x2k(k+2);
                        end
                else
                    subs(f, x1k(k+1));
                    k = k + 1;
                end
        elseif subs(f, x1k(k)) <= subs(f, x2k(k))
            %disp("THIRD");
            ak(k + 1) = ak(k);
            bk(k + 1) = x2k(k);
            x2k(k + 1) = x1k(k);
            x1k(k + 1) = ak(k + 1) +(fibb(n1 - k - 2)/fibb(n1 - k))*(bk(k + 1) - ak(k + 1));
            if k == n1 - 2
                var = 1;
                %disp("LAST ONE");
                x1k(k+2) = x1k(k + 1);
                x2k(k+2) = x1k(k + 1) + 0.01;
                    if subs(f, x1k(k+2)) > subs(f, x2k(k+2))
                        ak(k+2) = x1k(k+2);
                        bk(k+2) = bk(k+1);
                        
                    else 
                        ak(k+2) = ak(k+1);
                        bk(k+2) = x2k(k+2);
                        
                    end
            else 
                subs(f, x1k(k + 1));
                k = k + 1;
            end
        end 
    end
end