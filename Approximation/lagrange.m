function [vy] = lagrange(x, y, vx)

%{
    
    we use the formula for finding the lagrange 
    interpolation polynomial
    L   (X) = sum(yk * prod(        (X - x)/ (x - x) )
     n-1     k=1->n   i=1-> n,i!= k       i    k   i
%}

m = length(vx);

n = length(x);

vy = zeros(1, m);

for p = 1 : m

    Sum = 0;

    for k = 1 : n
        product = y(k);

        for i = 1 : n
            if k ~= i
                product = product * ( ( vx(p) - x(i) ) / ( x(k) - x(i) ) );
            end
        end
        Sum = Sum + product;
    end

    vy(p) = Sum;
end

