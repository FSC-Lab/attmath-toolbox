function dcm = rotationfwd(phi)
%ROTATIONFWD Rotation forward mapping
%   Returns a dcm from a rotation vector
%   This carries out the forward mapping from so(3) to SO(3), for larger
%   angles the Rodrigues formula is invoked instead
%   See AER1513 Course slides: lec9.pdf, pp. 41

phi = reshape(phi, [3,1]);
angle = norm(phi);

if angle < 1e-6
    dcm = eye(3) + hat(phi);
else
    axis = phi/angle;
    c = cos(angle);
    s = sin(angle);
    
    dcm = c*eye(3) + (1 - c)*(axis*axis') + s*hat(axis);
end

end

