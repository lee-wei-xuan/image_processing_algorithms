A = double(imread('sunflower.jpeg'));
egvc1 = zeros(640,3); % Largest eigenvectors
egvl1 = zeros(1,3); % Largest eigenvalues
tol = 1e-6; max_ite = 1000;
for c = 1:3 % For each color channel
    cA = A(:, :, c);
    cAt_cA = cA' * cA;
    [egvc1(:, c), egvl1(:, c)] = ...
    pwr_md(cAt_cA, tol, max_ite);
end


