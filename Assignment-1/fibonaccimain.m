syms x
f1 = (x - 2)^2 + x * log(x + 3);
f2 = 5^x + (2 - cos(x))^2;
f3 = exp(x) * (x^3 - 1) + (x - 1)*sin(x);

a = -1;
b = 3;
larray = zeros(1);

k = zeros(1);
k2 = zeros(1);
k3 = zeros(1);
count = 1;

%% different values for l

for l = linspace(0.0025, 0.1, 100)
    disp(count);
    [ak, bk, k(count)] = fibonaccialgo(a, b, l, f1);
    [ak2, bk2, k2(count)] = fibonaccialgo(a, b, l, f2);
    [ak3, bk3, k3(count)] = fibonaccialgo(a, b, l, f3);
    larray(count)=l;
    count = count + 1;
end

subplot(3,1,1);
plot(larray, k, 'r', 'LineWidth', 1);             
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό l');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});
 
subplot(3,1,2);
plot(larray, k2, 'g', 'LineWidth', 1);
t = '$f2(x) = 5^x + (2 - cos(x))^2$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό l');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});

subplot(3,1,3);
plot(larray, k3, 'b', 'LineWidth', 1);  
t = '$f3(x) = e^x \cdot (x^3 - 1) + (x - 1)\cdot sin(x)$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό l');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});

%% l = 0.3

figure;

l = 0.3;

[aknew, bknew, knew] = fibonaccialgo(a, b, l, f1);
[aknew2, bknew2, knew2] = fibonaccialgo(a, b, l, f2);
[aknew3, bknew3, knew3] = fibonaccialgo(a, b, l, f3);

subplot(3, 1, 1);

for i = 0:1:knew - 1
    plot(i, aknew(i + 1), 'or');
    hold on 
    plot(i, bknew(i + 1), '*r');
end
legend("ak", "bk");
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Σταθερό l = 0.3');

subplot(3, 1, 2);

for i = 0:1:knew2 - 1
    plot(i, aknew2(i + 1), 'og');
    hold on 
    plot(i, bknew2(i + 1), '*g');
end
legend("ak", "bk");
t = '$f2(x) = 5^x + (2 - cos(x))^2$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.3');

subplot(3, 1, 3);

for i = 0:1:knew3 - 1
    plot(i, aknew3(i + 1), 'ob');
    hold on 
    plot(i, bknew3(i + 1), '*b');
end
legend("ak", "bk");
t = '$f3(x) = e^x \cdot (x^3 - 1) + (x - 1)\cdot sin(x)$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.3');

%% l = 0.03
figure;
l = 0.03;

[aknew, bknew, knew] = fibonaccialgo(a, b, l, f1);
[aknew2, bknew2, knew2] = fibonaccialgo(a, b, l, f2);
[aknew3, bknew3, knew3] = fibonaccialgo(a, b, l, f3);

subplot(3, 1, 1);

for i = 0:1:knew - 1
    plot(i, aknew(i + 1), 'or');
    hold on 
    plot(i, bknew(i + 1), '*r');
end
legend("ak", "bk");
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Σταθερό l = 0.03');

subplot(3, 1, 2);

for i = 0:1:knew2 - 1
    plot(i, aknew2(i + 1), 'og');
    hold on 
    plot(i, bknew2(i + 1), '*g');
end
legend("ak", "bk");
t = '$f2(x) = 5^x + (2 - cos(x))^2$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.03');

subplot(3, 1, 3);

for i = 0:1:knew3 - 1
    plot(i, aknew3(i + 1), 'ob');
    hold on 
    plot(i, bknew3(i + 1), '*b');
end
legend("ak", "bk");
t = '$f3(x) = e^x \cdot (x^3 - 1) + (x - 1)\cdot sin(x)$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.03');

%% l = 0.003
figure;

[aknew, bknew, knew] = fibonaccialgo(a, b, l, f1);
[aknew2, bknew2, knew2] = fibonaccialgo(a, b, l, f2);
[aknew3, bknew3, knew3] = fibonaccialgo(a, b, l, f3);

subplot(3, 1, 1);

for i = 0:1:knew - 1
    plot(i, aknew(i + 1), 'or');
    hold on 
    plot(i, bknew(i + 1), '*r');
end
legend("ak", "bk");
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Σταθερό l = 0.003');

subplot(3, 1, 2);

for i = 0:1:knew2 - 1
    plot(i, aknew2(i + 1), 'og');
    hold on 
    plot(i, bknew2(i + 1), '*g');
end
legend("ak", "bk");
t = '$f2(x) = 5^x + (2 - cos(x))^2$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.003');

subplot(3, 1, 3);

for i = 0:1:knew3 - 1
    plot(i, aknew3(i + 1), 'ob');
    hold on 
    plot(i, bknew3(i + 1), '*b');
end
legend("ak", "bk");
t = '$f3(x) = e^x \cdot (x^3 - 1) + (x - 1)\cdot sin(x)$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.003');
