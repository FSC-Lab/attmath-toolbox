function M = hat(V)
%HAT Hat operator or cross operator
%   M = hat(V(3,1)) returns a 3-by-3 skew-symmetric matrix from a 3-by-1
%   rotation vector. This is the mapping from R(3) to so(3)
%
%   M = hat(V(6,1)) returns a 4-by-4 matrix from a 6-by-1 concatenation of
%   translation and rotation vectors. This is the mapping from R(6) to
%   se(3)

[r,c] = size(V);
if ( r > 1 && c > 1 )
    error('Input must be a vector');
end

len = max(r, c);
switch len
    case 3
    M = [   0, -V(3), V(2);
            V(3), 0, -V(1);
           -V(2), V(1), 0];
   
    case 6
    M = [   0, -V(6), V(5), V(1);
            V(6), 0, -V(4), V(2);
            -V(5), V(4), 0, V(3);
            zeros(1,4)];
    otherwise
        error(['Input vector is ' num2str(len) '-by 1. It is neither in R3 nor in R6.']);
end

end