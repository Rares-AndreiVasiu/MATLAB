A = [13 -10 12; -11 14 10; 0 12 -13];

%{
    a) the eigenvalues of the matrixA;
    b) for each eigenvalue of A a unit eigenvector;
    c) the singular values of matrixA;
    d) the condition number with respect to the inversion of matrix A.
%}

lambda = eig(A);

disp(lambda)

[vectors, values] = eig(A);

for i = 1 : 3
    disp(['the unit eigenvectors corresponding to the' ...
      'eigenvalue: ' num2str(lambda(i)) 'is: ']), vectors(:, i)
end

sing_valus = svd(A);

disp('The singular values'),sing_valus

% the condition number

condNum = cond(A);

disp('The condition number: '), condNum

