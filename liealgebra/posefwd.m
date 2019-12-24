function tform = posefwd(xi)
%POSEINV Pose forward mapping
%   Returns a transformation matrix from xi

xi = reshape(xi, [6,1]);
rho = xi(1:3);
phi = xi(4:6);

dcm = rotationfwd(phi);

angle = norm(phi);
if angle < 1e-9
    J = eye(3)+0.5*hat(phi);
else
    axis = phi/angle;
    s = sin(angle);
    c = cos(angle);
    J = s/angle*eye(3)+(1-s/angle)*(axis*axis')+(1-c)/angle*hat(axis);
end

tform = [dcm J*rho; zeros(1,3) 1];

end

