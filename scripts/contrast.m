% Adjusts contrast with hyperbolic tangent function
% Input: original pixel value x, 
%        contrast intensity alpha
% Output: pixel value after contrast adjustment
function f = contrast(x, alpha)
        f = (255/2)*tanh(alpha * (x-128)) + 128;
end