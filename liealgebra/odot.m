function mat = odot(p)
%ODOT odot map
%   Operator for reversing operands in the pose hat map
%   See AER1513 Course slides: lec10.pdf, pp. 12
    eps = p(1:3);
    eta = p(4);
    mat = [eye(3)*eta, -hat(eps); zeros(1,6)];
end

