function xi = poseinv(tform)
%POSEINV Pose inverse mapping
%   Returns xi from a transformation matrix
dcm = tform(1:3,1:3);
r = tform(1:3,4);

phi = rotationinv(dcm);
angle = norm(phi);
if angle < 1e-9 
    J_inv = eye(3)-0.5*hat(phi);
else
    axis = phi/angle;
    a = angle/2;
    ct = cot(a);
    J_inv = a*ct*eye(3) + (1-a*ct)*(axis*axis') - a*hat(axis);
end

xi = [J_inv*r; phi];
end

