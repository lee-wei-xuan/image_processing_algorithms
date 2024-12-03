% Function to solve a system of 
% linear equations using LU decomposition
% Input: matrix A, vector b
% Output: solution vector x
function x = LU_solver(A, b) 
    [L, U, P] = lu(A); % Predefined in MATLAB  
    y = fwdsub(L, P * b);
    x = backsub(U, y);
end