syms x y;

x = linspace(-5, 5);
y = linspace(-5, 5);
[x, y] = meshgrid(x, y);

f = x.^5 .* exp(- x.^2 - y.^2);

mesh(x, y, f);
grid on;
xlabel('x')
ylabel('y')
zlabel('z')
colorbar;
