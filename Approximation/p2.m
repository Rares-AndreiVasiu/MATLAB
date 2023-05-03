x = [0 1 2 3 4 5 6];

y = [15 30 75 60 60 40 55];

time = [0.5 3.2 5.7];

speed = zeros(1, length(time));

% a) linear interpolation

disp('The values of f obtained through linear interpolation:')
speed = interp1(x, y, time, 'linear')

newline;

% b) Lagrange polynomial interpolation 

disp('The values of f obtained through lagrange interpolation:')
speed = lagrange(x, y, time)

newline;

% c) piecewise cubic hermite interpolation polynomial

disp('The values of f obtained through cubic Hermite interpolation: ') 

speed = interp1(x, y, time, 'cubic')
   

% d) spline cubic interpolation

disp('The values of f obtained through spline interpolation: ') 
speed = spline(x, y, time)

newline;

% e) parabolic regression

P = polyfit(x, y, 2);

disp('parabolic regression: ')

speed = polyval(P, time)

% f) least squares 5th order polynomial method

P = polyfit(x, y, 5);

disp('5th order polynomial method: ')
speed = polyval(P, time)


