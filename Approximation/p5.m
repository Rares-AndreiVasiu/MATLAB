function p5(x, y)

vx = min(x) : 0.1 : max(x);

vy_spline = spline(x, y, vx);

vy_hermite = interp1(x, y, vx, 'pchip');

plot(x, y, 'rh', vx, vy_spline, 'b-', vx, vy_hermite,'g:', "LineWidth", 2)
