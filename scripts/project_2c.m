A = double(imread('sunflower.jpeg'));
K = 200; % Number of eigenvectors to find
egvcs = zeros(640,K,3); % For the eigenvectors
egvls = zeros(K,3); % For the eigenvalues
U = zeros(853,K,3); % For the u_i's
loss = zeros(K,1); % Loss of image quality
A_cmprs = zeros(853,640,3); % Compressed image
tol = 1e-6; max_ite = 1000;
for c = 1:3 % For each color channel
    cA = A(:, : , c);
    cAt_cA = cA' * cA;
    [egvcs(:, :, c), egvls(:,c)] = ...
    eg_vc_vl(cAt_cA, tol, max_ite, K);
    for i = 1:K % Compute the u_i's
        U(:, i, c) = ...
        normalize(cA * egvcs(:, i, c));
    end
end
for k = 1:K
    cur_loss = 0;
    for c = 1:3 
        A_cmprs(:, :, c) = ...
        A_cmprs(:, :, c) + sqrt(egvls(k,c)) * ...
        U(:, k, c) * egvcs(:, k, c)'; 
        cur_loss = cur_loss + ...
        norm(A(:, :, c) - A_cmprs(:, :, c));
    end
    if ismember(k, [5, 10, 20, 40, 80, 160])
        figure
        image(uint8(A_cmprs))
    end
    loss(k) = cur_loss;
end
figure
semilogy(1:K, loss)

