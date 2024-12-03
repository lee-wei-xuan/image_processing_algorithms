A = double(imread('sunflower.jpeg'));
egvc2 = zeros(640,3); % 2nd largest eigenvectors
egvl2 = zeros(1,3); % 2nd largest eigenvalues
tol = 1e-6; max_ite = 1000;
for c = 1:3 % For each color channel
    cA = A(:, :, c);
    cAt_cA = cA' * cA;
    [egvc2(:, c), egvl2(:, c)] = ...
    i_pwr(cAt_cA, tol, max_ite, egvl1(:, c) / 2);
end


