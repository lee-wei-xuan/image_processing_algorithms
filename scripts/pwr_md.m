% Finding the eigenvector and DOMINANT eigenvalue 
% of a matrix using the power method
% Input: Matrix A,
%        tol for stopping criteion,
%        max_ite for maximum number of iterations
% Output: eigenvector egvc and eigenvalue egvl
function [egvc, egvl] = pwr_md(A, tol, max_ite)
    n = size(A, 1);
    vc = rand(n, 1); % Initialization
    vc = normalize(vc);
    for i = 1:max_ite
        vc_temp = A * vc; 
        vc_temp = normalize(vc_temp);
        if norm(vc_temp - vc) < tol
            vc = vc_temp;
            break;
        end
        vc = vc_temp;
    end
    egvc = vc;
    egvl = vc' * A * vc;
end


