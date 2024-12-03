% Forward substitution method
% Input: Lower triangular matrix L, vector b
% Output: Solution vector x
function x = fwdsub(L, b) 
    n = size(L, 1);
    x = zeros(n, 1);
    for i = 1 : n
        sum = b(i, 1);
        for j = 1 : i-1
            sum = sum - L(i, j) * x(j, 1);
        end
        x(i, 1) = sum / L(i, i);
    end
end