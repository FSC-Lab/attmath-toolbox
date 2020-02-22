function V = vee(M)
%VEE vee operator or uncross operator
%   Returns a vector from a skew-symmetric matrix

V = [   M(3,2);
        M(1,3);
        M(2,1)];
end

