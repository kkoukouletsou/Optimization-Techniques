function [var] = Check(d, c, N)
var = 0;
a = 0;
b = 0;

% checking if x_i exceeds c_i
for i = 1:1:17
   if d(i) < c(i)
       a = 1;
   else
       a = 0;
   end
end

%floating point error
e = 10^(-9);

%checking each node
if d(1) + d(2) + d(3) + d(4) - N < e 
    if d(1) - d(5) - d(6) < e && d(2) - d(8) - d(7) < e &&  d(4) - d(9) - d(10) < e
        if d(3) + d(8) + d(9) - d(13) - d(11) - d(12) < e
            if d(13) + d(7) + d(6) - d(14) - d(15) < e
                if d(14) + d(5) - d(16) < e
                    if d(11) + d(10) - d(17) < e
                        if d(17) + d(12) + d(15) + d(16) - N < e
                            b = 1;
                        end
                    end
                end
            end
        end
    end
end
if a == 1 && b == 1
    var = 1;
end
end