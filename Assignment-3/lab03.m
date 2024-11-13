syms x y;

x1 = linspace(-5, 5);
x2 = linspace(-5, 5);
[x1, x2] = meshgrid(x1, x2);

f = 1/3 .* x1.^2 + 3 .* x2.^2;

mesh(x1, x2, f);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('$$f(x_1, x_2) = \frac{1}{3} \cdot x_1^2 + 3 \cdot x_2^2$$','interpreter','latex');
colorbar;
