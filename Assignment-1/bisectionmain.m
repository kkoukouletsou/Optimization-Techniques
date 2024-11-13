syms x
f1 = (x - 2)^2 + x * log(x + 3);
f2 = 5^x + (2 - cos(x))^2;
f3 = exp(x) * (x^3 - 1) + (x - 1)*sin(x);

a = -1;
b = 3;
l = 0.01;

k = zeros(1);
k2 = zeros(1);
k3 = zeros(1);
earray = zeros(1);
count=1;
%% different values for e
for e = linspace(0.000001, 0.00455, 100)                     
    disp(count);             
    [ak, bk, k(count)] = bisection(a, b, f1, l, e);
    [ak2, bk2, k2(count)] = bisection(a, b, f2, l, e);
    [ak3, bk3, k3(count)] = bisection(a, b, f3, l, e);
    earray(count) = e;
    count = count + 1;
end

subplot(3, 1, 1);
plot(earray, 2*k, 'r', 'LineWidth', 1);
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό ε');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});

subplot(3, 1, 2);
plot(earray, 2*k2, 'g', 'LineWidth', 1);
t = '$f2(x) = 5^x + (2 - cos(x))^2$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό ε');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});

subplot(3, 1, 3);
plot(earray, 2*k3, 'b', 'LineWidth', 1);
t = '$f3(x) = e^x \cdot (x^3 - 1) + (x - 1)\cdot sin(x)$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό ε');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});

%% different values for l
figure;

e = 0.001;
count2 = 1;
k_ = zeros(1);
k2_ = zeros(1);
k3_ = zeros(1);
larray = zeros(1);

for l = linspace(0.0025, 0.1, 100)
    disp(count2);
    [ak_, bk_, k_(count2)] = bisection(a, b, f1, l, e);
    [ak2_, bk2_, k2_(count2)] = bisection(a, b, f2, l, e);
    [ak3_, bk3_, k3_(count2)] = bisection(a, b, f3, l, e);
    larray(count2) = l;
    count2 = count2 + 1;
end

subplot(3, 1, 1);
plot(larray, 2*k_, 'r', 'LineWidth', 1);
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό l');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});

subplot(3, 1, 2);
plot(larray, 2*k2_, 'g', 'LineWidth', 1);
t = '$f2(x) = 5^x + (2 - cos(x))^2$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό l');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});

subplot(3, 1, 3);
plot(larray, 2*k3_, 'b', 'LineWidth', 1);
t = '$f3(x) = e^x \cdot (x^3 - 1) + (x - 1)\cdot sin(x)$';
title(t,'interpreter','latex');
xlabel('Μεταβλητό l');
ylabel({'Υπολογισμος';'Αντικειμενικής';'Συνάρτησης'});

figure; 
subplot(3, 1, 1);

%% l = 0.3

e = 0.001;
l = 0.3;

[aknew, bknew, knew] = bisection(a, b, f1, l, e);
[aknew2, bknew2, knew2] = bisection(a, b, f2, l, e);
[aknew3, bknew3, knew3] = bisection(a, b, f3, l, e);

for i = 0:1:knew - 1
    plot(i, aknew(i + 1), 'or');
    hold on 
    plot(i, bknew(i + 1), '*r');
end
legend("ak", "bk");
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.3');

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
 

figure;
e = 0.001;
l = 0.03;

subplot(3, 1, 1);

[aknew, bknew, knew] = bisection(a, b, f1, l, e);
[aknew2, bknew2, knew2] = bisection(a, b, f2, l, e);
[aknew3, bknew3, knew3] = bisection(a, b, f3, l, e);

for i = 0:1:knew - 1
    plot(i, aknew(i + 1), 'or');
    hold on 
    plot(i, bknew(i + 1), '*r');
end
legend("ak", "bk");
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.03');

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
subplot(3, 1, 1);

l = 0.003;
[aknew, bknew, knew] = bisection(a, b, f1, l, e);
[aknew2, bknew2, knew2] = bisection(a, b, f2, l, e);
[aknew3, bknew3, knew3] = bisection(a, b, f3, l, e);

for i = 0:1:knew - 1
    plot(i, aknew(i + 1), 'or');
    hold on 
    plot(i, bknew(i + 1), '*r');
end
legend("ak", "bk");
t = '$f1(x) = (x - 2)^2 + x \cdot ln(x + 3)$';
title(t,'interpreter','latex');
xlabel('Σταθερο l = 0.003');

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