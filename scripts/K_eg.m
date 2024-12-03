% Finding K greatest eigenvectors, eigenvalues 
% of a matrix using the power method
% Input:  matrix A,
%        tol for stopping criteion,
%        max_ite for maximum number of iterations
%        K for number of eigenvectors to find
% Output: eigenvectors egvcs and eigenvalues egvls
%        egvcs(: i) is the eigenvector 
%        corresponding to the eigenvalue egvls(i)
function [egvcs, egvls] = K_eg(A, tol, max_ite, K)
    n = size(A, 1);
    egvcs = zeros(n, K);
    egvls = zeros(K,1);
    pre_egvl = 0;
    pre_egvc = zeros(n, 1);
    I = eye(n);
    % Dominant eigenvectors of deflated matrix  
    pre_egvcs = zeros(n, n);
    for i = 1:K
        % Transformation makes dominant 
        % eigenvalue of preious matrix to be zero
        A = A - ...
            pre_egvl * (pre_egvc * pre_egvc');
        % Use Power Method to find the dominant 
        % eigenvalue and eigenvector
        [cur_egvc, cur_egvl] = ...
        pwr_md(A, tol, max_ite);
        % Aux matrix for equation
        % to find corrected eigenvector
        aux = I;
        for j = 1:i-1
            aux = (I - egvls(j)/cur_egvl * ...
        pre_egvcs(:, j) * pre_egvcs(:, j)')*aux;
        end
        % Recover the original eigenvector
        corrected_egvc = LU_solver(aux, cur_egvc);
        egvcs(:, i) = normalize(corrected_egvc);
        egvls(i) = cur_egvl;
        % Update eigenvectors of deflated matrix
        pre_egvcs(:, i) = cur_egvc;
        pre_egvc = cur_egvc;
        pre_egvl = cur_egvl;
    end
end



