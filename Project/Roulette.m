function[sum, I] = Roulette(fit)
total = 0;

%find total
for j = 1:1:10
        total = total + fit(j);
end

%find pr
pr = zeros(0);
for k = 1:1:10
    pr(k) = fit(k)/total;
end

% additional probability
[prSorted, I] = sort(pr);
q = zeros(1);
q(1) = prSorted(1);
for i = 2:1:10
    q(i) = q(i - 1) + prSorted(i);
end

sum = zeros(10,1);

for ii = 1:1:10
    var = rand;
    if var < q(1)
        sum(1) = sum(1) + 1;
    elseif var >= q(1) && var < q(2)
        sum(2) = sum(2) + 1;
    elseif var >= q(2) && var < q(3)
        sum(3) = sum(3) + 1;
    elseif var >= q(3) && var < q(4)
        sum(4) = sum(4) + 1;
    elseif var >= q(4) && var < q(5)
        sum(5) = sum(5) + 1;
    elseif var >= q(5) && var < q(6)
        sum(6) = sum(6) + 1;
    elseif var >= q(6) && var < q(7)
        sum(7) = sum(7) + 1;
    elseif var >= q(7) && var < q(8)
        sum(8) = sum(8) + 1;
    elseif var >= q(8) && var < q(9)
        sum(9) = sum(9) + 1;
    elseif var >= q(9) && var < q(10)
        sum(10) = sum(10) + 1;
    end
end
end