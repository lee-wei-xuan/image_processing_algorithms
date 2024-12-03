% Convert entries to double to avoid overflow
A = double(imread('sunflower.jpeg'));
% Adjust image contrast with different intensities
for intensity = [1, 0.02]
    % 11 points required for degree 10 
    % interpolating polynomial
    i = 1:11;
    % Base points for Chebyshev interpolation
    base_points = 255/2*(1+cos((2*i-1)*pi/(2*11)));
    values = contrast(base_points(i), intensity);
    % Coefficients of interpolating polynomial
    c = newtdd(base_points, values, 11);
    % Interpolating polynomial
    interpolate = @(x) nest(10, c, x, base_points);
    % Initialize matrix for new image
    A_new = zeros(size(A));
    for i = 1:853
       for j = 1:640
           for k = 1:3
            A_new(i,j,k) = interpolate(A(i,j,k));
           end
       end 
    end
    % Produce new image with adjusted contrast
    figure
    % Convert entries to uint8 to display image
    A_new = uint8(A_new);
    image(A_new)
end