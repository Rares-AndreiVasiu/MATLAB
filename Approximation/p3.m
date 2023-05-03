x = [0 1 2 3 4 5 6];

y = [15 30 75 60 60 40 55];

% time = [0.5 3.2 5.7];

vx = 0 : 0.1 : 6;

% a) linear interpolation
speed_linear = interp1(x, y, vx, 'linear');


% b) Lagrange polynomial interpolation 
speed_lagrange = lagrange(x, y, vx);


% c) piecewise cubic hermite interpolation polynomial
speed_hermite = interp1(x, y, vx, 'cubic');
   

% d) spline cubic interpolation
speed_cubic = spline(x, y, vx);


% e) parabolic regression

P = polyfit(x, y, 2);
speed_parabolic = polyval(P, vx);


% f) least squares 5th order polynomial method

vxg = min(vx)
P = polyfit(x, y, 5);
speed_5order = polyval(P, vx);


plot(x, y, 'ro', ...
    vx, speed_linear, 'b-.',  ...
    vx, speed_lagrange, 'c--',  ...
    vx, speed_hermite, 'm:', ...
    vx, speed_cubic, 'k-', ...
    vx, speed_parabolic,'r--', ...
    vx, speed_5order, 'g:', 'LineWidth', 3)

legend('points', 'linear', 'lagrange', 'hermite', ...
'cubic', 'parabolic', '5th Order')
