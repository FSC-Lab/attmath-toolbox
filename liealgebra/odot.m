function mat = odot(p)
%ODOT odot map
%   Operator for reversing the order of the pose hat map
    eps = p(1:3);
    eta = p(4);
    mat = [eye(3)*eta, -hat(eps); zeros(1,6)];
end

