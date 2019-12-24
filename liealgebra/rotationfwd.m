function dcm = rotationfwd(phi)
% Rotation forward mapping
%   Returns a dcm from a rotation angle

angle = norm(phi);

if angle < 1e-15
    dcm = eye(3) + hat(phi);
else
    axis = phi/angle;
    c = cos(angle);
    s = sin(angle);
    dcm = c*eye(3) + (1 - c)*(axis*axis') + s*hat(axis);
end

end

