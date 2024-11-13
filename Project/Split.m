function[d] = Split(d, dnew) 

if dnew(1) < 54.13 && dnew(2) < 21.56 && dnew(3) < 34.08 && dnew(4) < 49.19 && dnew(1) >= 0 && dnew(2) >= 0 && dnew(3) >= 0 && dnew(4) >= 0
    
    if d(1) ~= dnew(1)
        var2 = 0;
        while var2 == 0
            dnew(5) = rand * dnew(1);
            dnew(6) = dnew(1) - dnew(5);

            if dnew(5) < 33.03 && dnew(6) < 21.84 && dnew(5) >=0 && dnew(6) >= 0
                var2 = 1;
            end
        end
    end
    if dnew(2) ~= d(2)
        var3 = 0;
        while var3 == 0
            dnew(7) = rand * dnew(2);
            dnew(8) = dnew(2) - dnew(7);
            if dnew(7) < 29.96 && dnew(8) < 24.87 && dnew(7) >=0 && dnew(8) >= 0
                var3 = 1;
            end
        end
    end
    if dnew(4)~=d(4)
        var4 = 0;   
        while var4 == 0
            dnew(10) = rand * dnew(4);
            dnew(9) = dnew(4) - dnew(10);
            if dnew(9) < 47.24 && dnew(10) < 33.97 && dnew(9) >= 0 && dnew(10) >= 0
                var4 = 1;
            end
        end
    end
    if dnew(9) ~= d(9) || dnew(3) ~= d(3) || dnew(8) ~= d(8)
        var5 = 0;
        while var5 == 0
            newsum = dnew(9) + dnew(3) + dnew(8);
            dnew(11) = rand * newsum;
            dnew(12) = rand * newsum;
            dnew(13) = newsum - dnew(11) - dnew(12);
            dnew(17) = dnew(10) + dnew(11);
    
            if dnew(11) < 26.89 && dnew(12) < 32.76 && dnew(13) < 39.98 && dnew(17) < 59.73 && dnew(11) >= 0 && dnew(12) >= 0 && dnew(13) > 0 && dnew(17) > 0
                var5 = 1;
            end
        end
    end
    
    if dnew(7) ~= d(7) || dnew(6) ~= d(6) || dnew(13) ~= d(13) 
        var6 = 0;
        while var6 == 0
            newsum2 = dnew(6) + dnew(7) + dnew(13);
            dnew(14) = rand * 37.12;
            dnew(15) = newsum2 - dnew(14);
            dnew(16) = dnew(5) + dnew(14);
    
            if dnew(14) < 37.12 && dnew(15) < 53.83 && dnew(16) < 61.65  && dnew(14) >= 0 && dnew(15) >= 0 && dnew(16) >= 0 
                var6 = 1;
            end
        end
    end
    
    if dnew(10) ~= d(10) || dnew(11) ~= d(11)
        dnew(17) = dnew(10) + dnew(11);
    end
end
