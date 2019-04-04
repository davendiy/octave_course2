[x, y] = meshgrid(-4:0.5:4, -4:0.5:4);
dy = y ^ 2 - y;
dx = ones(size(dy));
quiver(x, y, dx, dy);
grid on;