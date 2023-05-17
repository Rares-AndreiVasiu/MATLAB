% 4x^2-13x+10

coeff = [4 -13 10];

sol = roots(coeff);

n = length(sol);

finalSol = zeros(n, 1);

index = 0;

for i = 1 : n 
    if imag(sol(i)) == 0 && sol(i) >= 1.5
        index = index + 1;
        finalSol(index) = sol(i);
    end
end

for i = 1 : index
    disp('solution '), finalSol(i)
end
