function [dnew] = MutationPart2(c)
    percent = - 15 + rand * 30;
    V = 100 + percent;
    d = Generation1Part2(V);
    dnew = d;
    %Normal Distribution
    mu = 0;
    sigma = 1;
    %Number of vectors that will be changed(could be 2, 3 or 4)
    Number = randi([2 4]);
    %vector that will be changed
    vectorToBeChanged = randi([1 4]);
    switch vectorToBeChanged
        case 1
            dx = (rand - 0.5) * normpdf(d(1), mu, sigma);
            dnew(1) = d(1) + dx;
            switch Number
                case 1
                    dnew(2) = d(2) - dx;
                case 2
                    dnew(3) = d(3) - dx;
                case 3
                    dnew(4) = d(4) - dx;
                case 4
                    g = rand;
                    dnew(2) = d(2) - g * dx;
                    dnew(3) = d(3) - (1 - g) * dx;
                case 5
                    g2 = rand;
                    dnew(2) = d(2) - g2 * dx;
                    dnew(4) = d(4) - (1 - g2) * dx;
                case 6
                    g3 = rand;
                    dnew(3) = d(3) - g3 * dx;
                    dnew(4) = d(4) - (1 - g3) * dx;
                case 7
                    fraction1 = rand;
                    fraction2 = rand;
                    fraction3 = rand;
                    sum = fraction1 + fraction2 + fraction3;
                    fraction1 = fraction1/sum;
                    fraction2 = fraction2/sum;
                    fraction3 = fraction3/sum;
                    dnew(2) = d(2) - fraction1 * dx;
                    dnew(3) = d(3) - fraction2 * dx;
                    dnew(4) = d(4) - fraction3 * dx;
            end
        case 2
            dx = (rand - 0.5) * normpdf(d(2), mu, sigma);
            dnew(2) = d(2) + dx;
            switch Number
                case 1
                    dnew(3) = d(3) - dx;
                case 2
                    dnew(4) = d(4) - dx;
                case 3
                    frac = rand;
                    dnew(3) = d(3) - frac * dx;
                    dnew(4) = d(4) - (1 - frac) * dx;
            end
        case 3
            dx = (rand - 0.5) * normpdf(d(3), mu, sigma);
            dnew(3) = d(3) + dx;
            dnew(4) = d(4) - dx;
    end
       
    dnew = Split(d, dnew);
    
    if Check(dnew, c, V) == 0
        %change must be rejected 
        dnew = d;
    end
end