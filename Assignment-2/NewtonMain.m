clear;
syms x y;
f(x, y) = (x.^5) .* exp(- x.^2 - y.^2);

grad_f = gradient(f, [x, y]);
hess_f = hessian(f, [x, y]);
e = 0.0001;

n1 = [0; 0];
n2 = [-1; 1];
n3 = [1; -1];
n4 = [-1.5; 0];
gk1 = 0.3;

%% αρχικό σημείο (0, 0)
[numbers1a, k1a] = NewtonConst(grad_f, hess_f, e, n1, gk1);
[numbers2a, k2a] = NewtonArmijo(f, grad_f, hess_f, e, n1);
[numbers3a, k3a] = NewtonMinimum(f, grad_f, hess_f, e, n1);

%% αρχικό σημείο (-1, 1)
[numbers1b, k1b] = NewtonConst(grad_f, hess_f, e, n2, gk1);
[numbers2b, k2b] = NewtonArmijo(f, grad_f, hess_f, e, n2);
[numbers3b, k3b] = NewtonMinimum(f, grad_f, hess_f, e, n2);

%% αρχικό σημείο το (1, -1)
[numbers1c, k1c] = NewtonConst(grad_f, hess_f, e, n3, gk1);
[numbers2c, k2c] = NewtonArmijo(f, grad_f, hess_f, e, n3);
[numbers3c, k3c] = NewtonMinimum(f, grad_f, hess_f, e, n3);

%% αρχικό σημείο το (-1.5, 0)
[numbers1d, k1d] = NewtonConst(grad_f, hess_f, e, n4, gk1);
[numbers2d, k2d] = NewtonArmijo(f, grad_f, hess_f, e, n4);
[numbers3d, k3d] = NewtonMinimum(f, grad_f, hess_f, e, n4);

%% Γραφική παράσταση συνάρτησης NewtonConst για όλα τα δοσμένα αρχικά σημεία
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

%%(-1.5, 0)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers1d(1, :), numbers1d(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;
%% Γραφική παράσταση συνάρτησης NewtonArmijo για όλα τα δοσμένα αρχικά σημεία
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

%%(-1.5, 0)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers2d(1, :), numbers2d(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
figure;
%% Γραφική παράσταση συνάρτησης NewtonMinimum για όλα τα δοσμένα αρχικά σημεία

%%(0, 0)
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

%%(-1.5, 0)
x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);
f = x.^5 .* exp(- x.^2 - y.^2);
mesh(x, y, f);
title("f(x, y) = x^5 * exp^{(-x^2-y^2)}");
hold on
plot(numbers3d(1, :), numbers3d(2, :), '-*r', 'MarkerSize', 8, 'LineWidth', 2);
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

%% Γραφικές Παραστάσεις Contour για αρχικό σημείο (-1.5, 0)
x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers1d(1, :), numbers1d(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (-1.5, 0)");
hold on
contour(x, y, z);
colorbar; 

figure;

x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers2d(1, :), numbers2d(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (-1.5, 0)");
hold on
contour(x, y, z);
colorbar; 

figure;

x = linspace(-2.6, 2.6);
y = linspace(-2.6, 2.6);
[x, y] = meshgrid(x, y);
z = x.^5 .* exp(-x.^2 - y.^2);
plot(numbers3d(1, :), numbers3d(2, :));
title("f(x, y) = x^5 * exp^{(-x^2-y^2)} και (x0, y0) = (-1.5, 0)");
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
title("Newton Constant (0, 0)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,2);
plot(numbers2a(1, :), k2a, '*r','LineWidth',1);
hold on
plot(numbers2a(2, :), k2a, 'ob', 'LineWidth', 1);
title("Newton Armijo (0, 0)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,3);
plot(numbers3a(1, :), k3a, '*r','LineWidth',1);
hold on
plot(numbers3a(2, :), k3a, 'ob', 'LineWidth', 1);
title("Newton Min (0, 0)");
xlabel("k"); 
ylabel("(x, y)");
figure;
%(-1, 1)

subplot(3,1,1);
plot(numbers1b(1, :), k1b, '*r','LineWidth',1);
hold on
plot(numbers1b(2, :), k1b, 'ob', 'LineWidth', 1);
title("Newton Constant (-1, 1)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,2);
plot(numbers2b(1, :), k2b, '*r','LineWidth',1);
hold on
plot(numbers2b(2, :), k2b, 'ob', 'LineWidth', 1);
title("Newton Armijo (-1, 1)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,3);
plot(numbers3b(1, :), k3b, '*r','LineWidth',1);
hold on
plot(numbers3b(2, :), k3b, 'ob', 'LineWidth', 1);
title("Newton Min (-1, 1)");
xlabel("k"); 
ylabel("(x, y)");
figure;
%%(1, -1)
subplot(3,1,1);
plot(numbers1c(1, :), k1c, '*r','LineWidth',1);
hold on
plot(numbers1c(2, :), k1c, 'ob', 'LineWidth', 1);
title("Newton Constant (1, -1)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,2);
plot(numbers2c(1, :), k2c, '*r','LineWidth',1);
hold on
plot(numbers2c(2, :), k2c, 'ob', 'LineWidth', 1);
title("Newton Armijo (1, -1)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,3);
plot(numbers3c(1, :), k3c, '*r','LineWidth',1);
hold on
plot(numbers3c(2, :), k3c, 'ob', 'LineWidth', 1);
title("Newton Min (1, -1)");
xlabel("k"); 
ylabel("(x, y)");
figure;

%%(-1.5, 0)
subplot(3,1,1);
plot(numbers1d(1, :), k1d, '*r','LineWidth',1);
hold on
plot(numbers1d(2, :), k1d, 'ob', 'LineWidth', 1);
title("Newton Constant (-1.5, 0)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,2);
plot(numbers2d(1, :), k2d, '*r','LineWidth',1);
hold on
plot(numbers2d(2, :), k2d, 'ob', 'LineWidth', 1);
title("Newton Armijo (-1.5, 0)");
xlabel("k"); 
ylabel("(x, y)");

subplot(3,1,3);
plot(numbers3d(1, :), k3d, '*r','LineWidth',1);
hold on
plot(numbers3d(2, :), k3d, 'ob', 'LineWidth', 1);
title("Newton Min (-1.5, 0)");
xlabel("k"); 
ylabel("(x, y)");


%% k statistics
disp("Newton Const για τα αρχικά σημεία (0, 0), (-1, 1), (1, -1), (-1.5, 0) αντίστοιχα " + k1a + ", " + k1b + ", " + k1c + ", " + k1d);
disp("Newton Armijo για τα αρχικά σημεία (0, 0), (-1, 1), (1, -1), (-1.5, 0) αντίστοιχα " + k2a + ", " + k2b + ", " + k2c + ", " + k2d);
disp("Newton Minimum για τα αρχικά σημεία (0, 0), (-1, 1), (1, -1), (-1.5, 0) αντίστοιχα " + k3a + ", " + k3b + ", " + k3c + ", " + k3d);

disp("Για αρχικό σημείο το (0, 0) με τις μεθόδους Constant, Armijo και Minimum αντίστοιχα έχω " + k1a + ", " + k2a + ", " + k3a + " επαναλήψεις");
disp("Για αρχικό σημείο το (-1, 1) με τις μεθόδους Constant, Armijo και Minimum αντίστοιχα έχω " + k1b + ", " + k2b + ", " + k3b + " επαναλήψεις");
disp("Για αρχικό σημείο το (1, -1) με τις μεθόδους Constant, Armijo και Minimum αντίστοιχα έχω " + k1c + ", " + k2c + ", " + k3c + " επαναλήψεις");
disp("Για αρχικό σημείο το (-1.5, 0) με τις μεθόδους Constant, Armijo και Minimum αντίστοιχα έχω " + k1d + ", " + k2d + ", " + k3d + " επαναλήψεις");
