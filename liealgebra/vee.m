function vec = vee(mat)
%VEE vee operator or uncross operator
%   Returns a vector from a skew-symmstric matrix
vec = [ mat(3,2);
        mat(1,3);
        mat(2,1)];
end

