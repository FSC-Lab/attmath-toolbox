function tform = posefwd(xi)
%POSEFWD Pose forward mapping
%   Returns a transformation matrix from xi, a 6-by-1 concatenation of a
%   translation and a rotation vector
%   This carries out the forward mapping from se(3) to SE(3), 
%   See AER1513 Course slides: lec9.pdf, pp. 45

xi = reshape(xi, [6,1]);
rho = xi(1:3);
phi = xi(4:6);

dcm = rotationfwd(phi);
angle = norm(phi);

if angle < 1e-6
    J = eye(3)+0.5*hat(phi);
else
    axis = phi/angle;
    s = sin(angle);
    c = cos(angle);
    J = s/angle*eye(3)+(1-s/angle)*(axis*axis')+(1-c)/angle*hat(axis);
end

tform = [dcm J*rho; zeros(1,3) 1];

end

