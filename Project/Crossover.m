function [d1new, d2new] = Crossover(d1, d2, c, set, N)
d1new = zeros(1);
d2new = zeros(1);

if set == 1
    for i = 1:1:17
        d1new(i) = (d1(i) + d2(i))/2;
        d2new(i) = (d1(i) + d2(i))/2;
    end

elseif set == 2
    for i = 1:1:18
        d1new(i) = (d1(i) + d2(i))/2;
        d2new(i) = (d1(i) + d2(i))/2;
    end
end
if Check(d1new, c, N) == 0 || Check(d2new, c, N) == 0
    %change must be rejected
    d1new = d1;
    d2new = d2;
end    


end