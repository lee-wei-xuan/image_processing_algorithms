% Finding the eigenvalue closest to  
% a given value mu and its eigenvector
% Input: Matrix A,
%        tol for stopping criteion,
%        max_ite for maximum number of iterations
%        mu for the given value
% Output: eigenvector egvc and eigenvalue egvl
function [egvc, egvl] = i_pwr(A, tol, max_ite, mu)
    n = size(A, 1);
    I = eye(n);
    vc = rand(n, 1); % Initialization
    vc = normalize(vc);
    for i = 1:max_ite
        % Use LU_solver to solve 
        % (A - mu * I) * vc_temp = vc, to get
        % vc_temp = (A - mu * I)^(-1) * vc
        vc_temp = LU_solver(A - mu * I, vc); 
        vc_temp = normalize(vc_temp);
        if norm(vc_temp - vc) < tol
            vc = vc_temp;
            break;
        end
        vc = vc_temp;
    end
    egvc = vc;
    egvl = 1/(vc' * LU_solver(A - mu*I, vc)) + mu;
end



