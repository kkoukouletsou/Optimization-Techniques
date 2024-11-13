function [chr2] = NextGenerationPart2(chr1, sum, I, N)

count = 1;
for i = 1:1:10
    if sum(i) ~= 0
        for j = 1:1:sum(i)
            chr2(count, :) = chr1(I(i), :);
            count = count + 1;
        end
    end
end

for i = 1:1:10
    chr2(i, 18) = N;
end

end