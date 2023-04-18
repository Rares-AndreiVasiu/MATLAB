function [eigenValues, eigenVectors] = Leverrier(A)

%{
       initiliaze the variables needed for computing using Leverrier method
       Method description:
       1)find the coefficientes of ci, i=1,n+1 of the characteristic
       polynomial. Subsetps:
           a) Set c1 = 1
           b) Initialize B = A
           c) Find c2 = -sum(bii) i=1,n
           d) for any step k>1, set B(k) = A*[B(k-1)+ ck*I]
           e) The calculate c(k+1) = -1/k*sum(bii)^k, i=1,n
       2) Calculate the eigenValues solving the characteristic polynomial
       3) Determinig the eigenVectors performing the steps aforementioned
          a)-e)
%}

%{
    we create a 0-filled 1D array with n columns, where each column 
    represents the coefficient of the characteristic polynomial
%}
n = size(A, 1);

c = zeros(1, n); 

eigenValues = [];

eigenVectors = zeros(n);

c(1) = 1;

B = A; 

c(2) = (-1) * trace(B);

for k = 2 : n
    B = A * (B + c(k) * eye(n));
    c(k + 1) = (-1 / k) * trace(B);
end

%{
    now we are at step No.2 where we find the eigenvalues (roots)
    of the characteristic polynomial
%}

eigenValues = roots(c);

eigenValues = sort(eigenValues);


for i = 1 : n
    % Replace eigenValue(i) in the system linear and homogenous
    system = A - eigenValues(i) * eye(n);

    b = zeros(n, 1);

    for j = 1 : n
        if i ~= j
            b(j) = (-1) * system(j, 1);
        end
    end

    system = system([1 : i - 1, i + 1 : end], 2 : end);
    
    b = b([1 : i - 1, i + 1 : end], 1 : end);

    eigenVectors( 2: end, i) = system \ b;
    
    eigenVectors(1, i) = 1;
end
