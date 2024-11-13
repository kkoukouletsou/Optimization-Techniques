syms x1 x2
f = 1/3 .* x1.^2 + 3 .* x2.^2;
df  = gradient(f);

sk2 = 5;
sk3 = 15;
sk4 = 0.1;
gk2 = 0.5;
gk3 = 0.1;
gk4 = 0.2;

e = 0.01;

point2 = [5; -5];
point3 = [-5, 10];
point4 = [8, -10];
projected_point4 = [5, -8];

%constraints
c1 = [-10 5];
c2 = [-8 12];

%function call

[numbers1_2, numbers2_2, k2] = SteepestWithProjection(df, sk2, gk2, e, point2, c1, c2);
[numbers1_3, numbers2_3, k3] = SteepestWithProjection(df, sk3, gk3, e, point3, c1, c2);
[numbers1_4a, numbers2_4a, k4a] = SteepestWithProjection(df, sk4, gk4, e, point4, c1, c2);
[numbers1_4b, numbers2_4b, k4b] = SteepestWithProjection(df, sk4, gk4, e, projected_point4, c1, c2);

%% contour plots
xaxis = linspace(-10, 10);
yaxis = linspace(-10, 10);
[xaxis, yaxis] = meshgrid(xaxis, yaxis);
z = 1/3 .* xaxis.^2 + 3 .* yaxis.^2;
plot(numbers1_2, numbers2_2);
title('$$ f(x_1, x_2) =  \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2$$', 'interpreter', 'latex');
hold on;
contour(xaxis, yaxis, z);
colorbar;

figure;
xaxis = linspace(-10, 10);
yaxis = linspace(-10, 10);
[xaxis, yaxis] = meshgrid(xaxis, yaxis);
z = 1/3 .* xaxis.^2 + 3 .* yaxis.^2;
plot(numbers1_3, numbers2_3);
title('$$ f(x_1, x_2) =  \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2 $$', 'interpreter', 'latex');
hold on;
contour(xaxis, yaxis, z);
colorbar;
figure;

xaxis = linspace(-10, 10);
yaxis = linspace(-10, 10);
[xaxis, yaxis] = meshgrid(xaxis, yaxis);
z = 1/3 .* xaxis.^2 + 3 .* yaxis.^2;
plot(numbers1_4a, numbers2_4a);
title('$$ f(x_1, x_2) =  \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2 $$', 'interpreter', 'latex');
hold on;
contour(xaxis, yaxis, z);
colorbar;

figure;
xaxis = linspace(-10, 10);
yaxis = linspace(-10, 10);
[xaxis, yaxis] = meshgrid(xaxis, yaxis);
z = 1/3 .* xaxis.^2 + 3 .* yaxis.^2;
plot(numbers1_4b, numbers2_4b);
title('$$ f(x_1, x_2) =  \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2 $$', 'interpreter', 'latex');
hold on;
contour(xaxis, yaxis, z);
colorbar;
figure;

%% xk plots
xx1 = linspace(-2.6, 2.6);
xx2 = linspace(-2.6, 2.6);
[xx1, xx2] = meshgrid(xx1, xx2);
z = 1/3 .* xx1.^2 + 3 .* xx2.^2;
mesh(xx1, xx2, z);
plot(numbers1_2, '-.b', 'MarkerSize', 4, 'LineWidth', 1);
hold on
plot(numbers2_2, 'or', 'MarkerSize', 2, 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2$$','interpreter','latex');
figure;

xx1 = linspace(-2.6, 2.6);
xx2 = linspace(-2.6, 2.6);
[xx1, xx2] = meshgrid(xx1, xx2);
z = 1/3 .* xx1.^2 + 3 .* xx2.^2;
mesh(xx1, xx2, z);
plot(numbers1_3, '-.b', 'MarkerSize', 4, 'LineWidth', 1);
hold on
plot(numbers2_3, 'or', 'MarkerSize', 2, 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2$$','interpreter','latex');
figure;

xx1 = linspace(-2.6, 2.6);
xx2 = linspace(-2.6, 2.6);
[xx1, xx2] = meshgrid(xx1, xx2);
z = 1/3 .* xx1.^2 + 3 .* xx2.^2;
mesh(xx1, xx2, z);
plot(numbers1_4a, '-.b', 'MarkerSize', 4, 'LineWidth', 1);
hold on
plot(numbers2_4a, 'or', 'MarkerSize', 2, 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2$$','interpreter','latex');
figure;

xx1 = linspace(-2.6, 2.6);
xx2 = linspace(-2.6, 2.6);
[xx1, xx2] = meshgrid(xx1, xx2);
z = 1/3 .* xx1.^2 + 3 .* xx2.^2;
mesh(xx1, xx2, z);
plot(numbers1_4b, '-.b', 'MarkerSize', 4, 'LineWidth', 1);
hold on
plot(numbers2_4b, 'or', 'MarkerSize', 2, 'LineWidth', 1);
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2$$','interpreter','latex');

%%number of iterations
disp("Στο θέμα 2 γίνονται " + k2 + " επαναλήψεις");
disp("Στο θέμα 3 γίνονται " + k3 + " επαναλήψεις");
disp("Στο θέμα 4 γίνονται " + k4a + " επαναλήψεις");
disp("Στην παραλλαγή του θέματος 4 γίνονται " + k4b + " επαναλήψεις");

