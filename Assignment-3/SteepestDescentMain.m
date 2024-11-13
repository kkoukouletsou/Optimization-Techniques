clear;
syms x1 x2;
f(x1, x2) = 1/3 .* x1.^2 + 3 .* x2.^2;
grad_f = gradient(f, [x1, x2]);

n = [-1.5; 1.5];

gk1 = 0.1;
gk2 = 0.3;
gk3 = 3;
gk4 = 5;

e = 0.001;

[numbers1, k1] = SteepestDescentConst(grad_f, n, e, gk1);
[numbers2, k2] = SteepestDescentConst(grad_f, n, e, gk2);
[numbers3, k3] = SteepestDescentConst(grad_f, n, e, gk3);
[numbers4, k4] = SteepestDescentConst(grad_f, n, e, gk4);

%% Contour Plots
%gk = 0.1
x1 = linspace(-2.6, 2.6);
x2 = linspace(-2.6, 2.6);
[x1, x2] = meshgrid(x1, x2);
z = 1/3 .* x1.^2 + 3 .* x2.^2;
plot(numbers1(1, :), numbers1(2, :), 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2, gk = 0.1$$','interpreter','latex');

hold on
contour(x1, x2, z);
colorbar;
figure;

%gk = 0.3
x1 = linspace(-2.6, 2.6);
x2 = linspace(-2.6, 2.6);
[x1, x2] = meshgrid(x1, x2);
z = 1/3 .* x1.^2 + 3 .* x2.^2;
plot(numbers2(1, :), numbers2(2, :), 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2, gk = 0.3$$','interpreter','latex');
hold on
contour(x1, x2, z);
colorbar;
figure;

%gk = 3
x1 = linspace(-2.6, 2.6);
x2 = linspace(-2.6, 2.6);
[x1, x2] = meshgrid(x1, x2);
z = 1/3 .* x1.^2 + 3 .* x2.^2;
plot(numbers3(1, :), numbers3(2, :), 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2, gk = 3$$','interpreter','latex');
hold on
contour(x1, x2, z);
colorbar;
figure;

%gk = 5
x1 = linspace(-2.6, 2.6);
x2 = linspace(-2.6, 2.6);
[x1, x2] = meshgrid(x1, x2);
z = 1/3 .* x1.^2 + 3 .* x2.^2;
plot(numbers4(1, :), numbers4(2, :), 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2, gk = 5$$','interpreter','latex');
hold on
contour(x1, x2, z);
colorbar;
figure;

%% xk - plots
%gk = 0.1
x1 = linspace(-2.6, 2.6);
x2 = linspace(-2.6, 2.6);
[x1, x2] = meshgrid(x1, x2);
z = 1/3 .* x1.^2 + 3 .* x2.^2;
mesh(x1, x2, z);
plot(numbers1(2, :), '-.b', 'MarkerSize', 4, 'LineWidth', 1);
hold on
plot(numbers1(1, :), 'or', 'MarkerSize', 2, 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2, gk = 0.1$$','interpreter','latex');
figure;

%gk = 0.3
x1 = linspace(-2.6, 2.6);
x2 = linspace(-2.6, 2.6);
[x1, x2] = meshgrid(x1, x2);
z = 1/3 .* x1.^2 + 3 .* x2.^2;
mesh(x1, x2, z);
plot(numbers2(2, :), '-.b', 'MarkerSize', 4, 'LineWidth', 1);
hold on
plot(numbers2(1, :), 'or', 'MarkerSize', 2, 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2, gk = 0.3$$','interpreter','latex');
figure;

%gk = 3
x1 = linspace(-2.6, 2.6);
x2 = linspace(-2.6, 2.6);
[x1, x2] = meshgrid(x1, x2);
z = 1/3 .* x1.^2 + 3 .* x2.^2;
mesh(x1, x2, z);
plot(numbers3(2, :), '-.b', 'MarkerSize', 4, 'LineWidth', 1);
hold on
plot(numbers3(1, :), 'or', 'MarkerSize', 2, 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2, gk = 3$$','interpreter','latex');
figure;

%gk = 5
x1 = linspace(-2.6, 2.6);
x2 = linspace(-2.6, 2.6);
[x1, x2] = meshgrid(x1, x2);
z = 1/3 .* x1.^2 + 3 .* x2.^2;
mesh(x1, x2, z);
plot(numbers4(2, :), '-.b', 'MarkerSize', 4, 'LineWidth', 1);
hold on
plot(numbers4(1, :), 'or', 'MarkerSize', 2, 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2, gk = 5$$','interpreter','latex');

%% total number of iterations

disp("Για gk = 0.1 έχουμε " + k1 + " επαναλήψεις");
disp("Για gk = 0.3 έχουμε " + k2 + " επαναλήψεις");
disp("Για gk = 3 έχουμε " + k3 + " επαναλήψεις");
disp("Για gk = 5 έχουμε " + k4 + " επαναλήψεις");