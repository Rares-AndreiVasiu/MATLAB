syms a b c;

sol=solve(a+c-2*b,a+b+c-30,...
(a-5)*c-(b-4)^2,a,b,c);

% displaying the solutions
for i=1:length(sol.a)
disp([sol.a(i) sol.b(i) sol.c(i)])
end
