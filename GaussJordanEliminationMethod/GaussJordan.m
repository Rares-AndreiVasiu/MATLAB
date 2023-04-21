function invA = gaussJordan(A)

%{
    Check for square matrix
%}

[m, n] = size(A);

if m ~= n
    disp('Matrix must be square!')
else
    
    %{ 
        Compute augmented matrix
    %}
    
    augA = [A eye(n)];
    
    %{ 
        Do row operations to get the identity matrix on the left hand-side
    %}
    
    for i = 1 : n
        %{ 
            Find the pivot row
        %}
        
        [~, pivot] = max( abs( augA(i : n, i) ) );
        
        pivot = pivot + i - 1;
        
        %{ 
            Swap the current row with the pivot row
        %}
    
        if i ~= pivot
            augA( [i pivot], : ) = augA( [pivot i], : );
        end
    
        %{ 
            Divide the pivot row by the pivot element to make it 1
        %}
        pivot_element = augA(i, i);
    
        if pivot_element == 0
            error('Matrix is singular.');
        end
    
        augA(i, :) = augA(i, :) / pivot_element;
        
        % Step 3d: Eliminate the other elements in the current column
        for j = 1:n
            if j ~= i
                factor = augA(j, i);
    
                augA(j, :) = augA(j, :) - factor * augA(i, :);
            end
        end
    end
    
    % get inverse matrix from augmented matrix
    invA = augA(:, n + 1 : end);
end

end
