function gamma  = quat2g(q)
% QUAT2G Gamma-Map
%   Returns a 4-by-3 matrix gamma from an input quaternion. Postmultiply
%   gamma by a 3-by-1 angular velocity vector to find quaternion rates

    q = normalize(q, 'norm');
    gamma = 0.5*[   -q(2), -q(3), -q(4);
                    q(1), -q(4), q(3);
                    q(4), q(1), -q(2);
                    -q(3), q(2), q(1)];
end
