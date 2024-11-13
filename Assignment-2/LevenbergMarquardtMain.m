clear;
syms x y;
f(x, y) = (x.^5) .* exp(- x.^2 - y.^2);

grad_f = gradient(f, [x, y]);
hess_f = hessian(f, [x, y]);
e = 0.0001;
gk1 = 0.7;  

n1 = [0; 0];
n2 = [-1; 1];
n3 = [1; -1]; 

%% αρχικό σημείο (0, 0)
[numbers1a, k1a] = LevenbergMarquardtConst(f, grad_f, hess_f, n1, e, gk1); 
[numbers2a, k2a] = LevenbergMarquardtArmijo(f, grad_f, hess_f, n1, e);
[numbers3a, k3a] = LevenbergMarquardtMinimum(f, grad_f, hess_f, n1, e);

%% αρχικό σημείο (-1, 1)
[numbers1b, k1b] = LevenbergMarquardtConst(f, grad_f, hess_f, n2, e, gk1);
[numbers2b, k2b] = LevenbergMarquardtArmijo(f, grad_f, hess_f, n2, e);
[numbers3b, k3b] = LevenbergMarquardtMinimum(f, grad_f, hess_f, n2, e);

%% αρχικό σημείο (1, -1)
[numbers1c, k1c] = LevenbergMarquardtConst(f, grad_f, hess_f, n3, e, gk1);
[numbers2c, k2c] = LevenbergMarquardtArmijo(f, grad_f, hess_f, n3, e);
[numbers3c, k3c] = LevenbergMarquardtMinimum(f, grad_f, hess_f, n3, e);

%% Γραφική παράσταση συνάρτησης LM -Const για όλα τα δοσμένα αρχικά σημεία
%%(0, 0)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers1a(1, :), numbers1a(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%%(-1, 1)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers1b(1, :), numbers1b(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%%(1, -1)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers1c(1, :), numbers1c(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%% Γραφική παράσταση συνάρτησης LM - Armijo για όλα τα δοσμένα αρχικά σημεία
%%(0, 0)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers2a(1, :), numbers2a(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%%(-1, 1)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers2b(1, :), numbers2b(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%%(1, -1)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers2c(1, :), numbers2c(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%% Γραφική παράσταση συνάρτησης LM - Minimum για όλα τα δοσμένα αρχικά σημεία

%(0, 0)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers3a(1, :), numbers3a(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%%(-1, 1)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers3b(1, :), numbers3b(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%%(1, -1)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers3c(1, :), numbers3c(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;

%% Γραφικές Παραστάσεις Contour για αρχικό σημείο (0, 0)
x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers1a(1, :), numbers1a(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (0, 0)");
hold on
contour(x, y, z);
colorbar; 

figure;

x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers2a(1, :), numbers2a(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (0, 0)");
hold on
contour(x, y, z);
colorbar; 

figure;

x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers3a(1, :), numbers3a(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (0, 0)");
hold on
contour(x, y, z);
colorbar; 
figure;

%% Γραφικές Παραστάσεις Contour για αρχικό σημείο (-1, 1)
x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers1b(1, :), numbers1b(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (-1, 1)");
hold on
contour(x, y, z);
colorbar; 

figure;

x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers2b(1, :), numbers2b(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (-1, 1)");
hold on
contour(x, y, z);
colorbar; 

figure;

x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers3b(1, :), numbers3b(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (-1, 1)");
hold on
contour(x, y, z);
colorbar;
figure;

%% Γραφικές Παραστάσεις Contour για αρχικό σημείο (1, -1)
x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers1c(1, :), numbers1c(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (1, -1)");
hold on
contour(x, y, z);
colorbar; 

figure;

x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers2c(1, :), numbers2c(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (1, -1)");
hold on
contour(x, y, z);
colorbar; 

figure;

x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers3c(1, :), numbers3c(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (1, -1)");
hold on
contour(x, y, z);
colorbar; 
figure;

%% k plots
%%(0, 0)
subplot(3,1,1);
plot(numbers1a(1, :), k1a, '*r','LineWidth',1);
hold on
plot(numbers1a(2, :), k1a, 'ob', 'LineWidth', 1);
title("L - M Constant (0, 0)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,2);
plot(numbers2a(1, :), k2a, '*r','LineWidth',1);
hold on
plot(numbers2a(2, :), k2a, 'ob', 'LineWidth', 1);
title("L - M Armijo (0, 0)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,3);
plot(numbers3a(1, :), k3a, '*r','LineWidth',1);
hold on
plot(numbers3a(2, :), k3a, 'ob', 'LineWidth', 1);
title("L - M Min (0, 0)");
xlabel("k"); 
ylabel("(x, y)");
figure;
%(-1, 1)

subplot(3,1,1);
plot(numbers1b(1, :), k1b, '*r','LineWidth',1);
hold on
plot(numbers1b(2, :), k1b, 'ob', 'LineWidth', 1);
title("L - M Constant (-1, 1)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,2);
plot(numbers2b(1, :), k2b, '*r','LineWidth',1);
hold on
plot(numbers2b(2, :), k2b, 'ob', 'LineWidth', 1);
title("L - M Armijo (-1, 1)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,3);
plot(numbers3b(1, :), k3b, '*r','LineWidth',1);
hold on
plot(numbers3b(2, :), k3b, 'ob', 'LineWidth', 1);
title("L - M Min (-1, 1)");
xlabel("k"); 
ylabel("(x, y)");
figure;
%%(1, -1)
subplot(3,1,1);
plot(numbers1c(1, :), k1c, '*r','LineWidth',1);
hold on
plot(numbers1c(2, :), k1c, 'ob', 'LineWidth', 1);
title("L - M Constant (1, -1)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,2);
plot(numbers2c(1, :), k2c, '*r','LineWidth',1);
hold on
plot(numbers2c(2, :), k2c, 'ob', 'LineWidth', 1);
title("L - M Armijo (1, -1)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,3);
plot(numbers3c(1, :), k3c, '*r','LineWidth',1);
hold on
plot(numbers3c(2, :), k3c, 'ob', 'LineWidth', 1);
title("L - M Min (1, -1)");
xlabel("k"); 
ylabel("(x, y)");
%% k statistics
disp("L - M Const για τα αρχικά σημεία (0, 0), (-1, 1), (1, -1) αντίστοιχα " + k1a + ", " + k1b + ", " + k1c);
disp("L - M Armijo για τα αρχικά σημεία (0, 0), (-1, 1), (1, -1) αντίστοιχα " + k2a + ", " + k2b + ", " + k2c);
disp("L - M Minimum για τα αρχικά σημεία (0, 0), (-1, 1), (1, -1) αντίστοιχα " + k3a + ", " + k3b + ", " + k3c);

disp("Για αρχικό σημείο το (0, 0) με τις μεθόδους Constant, Armijo και Minimum αντίστοιχα έχω " + k1a + ", " + k2a + ", " + k3a + " επαναλήψεις");
disp("Για αρχικό σημείο το (-1, 1) με τις μεθόδους Constant, Armijo και Minimum αντίστοιχα έχω " + k1b + ", " + k2b + ", " + k3b + " επαναλήψεις");
disp("Για αρχικό σημείο το (1, -1) με τις μεθόδους Constant, Armijo και Minimum αντίστοιχα έχω " + k1c + ", " + k2c + ", " + k3c + " επαναλήψεις");
