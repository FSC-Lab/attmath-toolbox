function s = quat2s(q)
% QUAT2S S-Map
%   Returns a 3-by-4 matrix S from an input 3-by-1 angular velocity vector.
%   Postmultiply S by a quaternion to find quaternion rates
    s =	2*[     -q(2), q(1), q(4), -q(3);
                -q(3), -q(4), q(1), q(2);
                -q(4), q(3), -q(2), q(1)];
end
