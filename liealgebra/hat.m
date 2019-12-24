function hat = hat(rot)
%HAT Hat operator
%   Returns skew-symmetric matrix from a vector
hat = [0 -rot(3) rot(2);
       rot(3) 0 -rot(1);
       -rot(2) rot(1) 0];

end