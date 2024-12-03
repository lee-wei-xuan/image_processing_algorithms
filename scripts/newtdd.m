% From Sauer's Book: Program 3.1 
% Newton's Divided Difference Interpolation Method
% Computes coefficients of interpolating polynomial
% Input:  x and y are vectors containing the 
%         x and y coordinates of the n data points
% Output: coefficients c of interpolating 
%         polynomial in nested form
% Use nest.m to evaluate interpolating polynomial
function c=newtdd(x,y,n)
    v = zeros(n,n);   % v is the Newton triangle
    c = zeros(n,1);
    for j=1:n         % Fill in the 1st
        v(j,1)=y(j);  % column of Newton triangle
    end
    for i=2:n         % For column i, fill in
        for j=1:n+1-i % column from top to bottom
            v(j,i)=(v(j+1,i-1)-v(j,i-1))...
                    /(x(j+i-1)-x(j));
        end
    end
    for i=1:n
        c(i)=v(1,i);  % Read along top of triangle
    end               % for output coefficients
end

