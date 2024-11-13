function [f] = FitnessFunction(a, c, chr1)
time = zeros(17, 10);
f = zeros(10, 1);
total = zeros(1, 10);

%for each chromosome
for j = 1:1:10
    %for each road of a chromosome
    for i = 1:1:17
        time(i, j) = a(i) * chr1(j, i)/(1 - chr1(j, i)/c(i));
        mul = time(i, j) * chr1(j, i);
        total(j) = total(j) + mul;
    end
end

for k = 1:1:10
    f(k) = 1/total(k);
end
end