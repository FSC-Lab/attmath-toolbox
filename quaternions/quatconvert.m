function out = quatconvert(q, type)
    narginchk(1,2);

    if nargin == 1
        type = "dcm";
    end
    
    if norm(q(2:4)) == 0
        axis = [1;0;0];
    else
        axis = normalize(q(2:4), "norm");
    end
    
    q = normalize(q(:), "norm");

    if any(strcmpi(type, ["dcm", "rotm", "rotation matrix", "rotationmatrix"]))
        out = [ 1 - 2*q(3)*q(3) - 2*q(4)*q(4), 2*q(2)*q(3) + 2*q(1)*q(4), 2*q(2)*q(4) - 2*q(1)*q(3);
                2*q(2)*q(3) - 2*q(1)*q(4), 1 - 2*q(2)*q(2) - 2*q(4)*q(4), 2*q(3)*q(4) + 2*q(1)*q(2);
                2*q(2)*q(4) + 2*q(1)*q(3), 2*q(3)*q(4) - 2*q(1)*q(2), 1 - 2*q(2)*q(2) - 2*q(3)*q(3)];
    
    elseif any(strcmpi(type, ["eul", "euler angle", "eulerangle"]))
        out = [ atan2(2*q(1)*q(2) + 2*q(3)*q(4), 1 - 2*q(2)^2 - 2*q(3)^2);
                asin(2*q(1)*q(3) - 2*q(4)*q(2));
                atan2(2*q(1)*q(4) +2*q(2)*q(3), 1-2*q(3)^2 - 2*q(4)^2)];
      
    elseif any(strcmpi(type, ["axang", "axis angle", "axisangle"]))
        out = [ 2*acos(q(1));
                axis];
            
    elseif any(strcmpi(type, ["rotv", "rotation vector", "rotationvector"]))
        out = 2*acos(q(1))*axis;
            
    else
        error("Invalid rotation formalism specified")
    end
end