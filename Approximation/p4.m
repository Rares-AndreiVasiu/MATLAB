function [vy_linear, vy_cubic] = p4(x, y, vx)

vy_linear = interp1(x, y, vx, 'linear');

P3 = polyfit(x, y, 3);

vy_cubic = polyval(P3, vx);

