syms x a b;

f = a * (exp( -a ) - 1) * x + b * (exp( -a) + 1);

solx = solve(f);

disp(solx)
