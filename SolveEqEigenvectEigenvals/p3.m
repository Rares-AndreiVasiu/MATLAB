coeff = [1 1 -2 4 11 -45 -50 0];

partialSol = roots(coeff);

n = length(partialSol);

index = 0;

finalSol = zeros(n, 1);

for i = 1 : n
    if real(partialSol(i)) > 0
        index = index + 1;
        finalSol(index) = partialSol(i);
    end
end

for i = 1 : index
    disp('solution '), finalSol(i)
end
