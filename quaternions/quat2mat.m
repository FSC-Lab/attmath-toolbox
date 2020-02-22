function dcm = quat2mat(q)
%QUAT2MAT Quaternion to rotation matrix converion
    if abs(norm(q) - 1) > 1e-5
        q = q / norm(q);
    end

    dcm = [ 1 - 2*q(3)*q(3) - 2*q(4)*q(4), 2*q(2)*q(3) + 2*q(1)*q(4), 2*q(2)*q(4) - 2*q(1)*q(3);
            2*q(2)*q(3) - 2*q(1)*q(4), 1 - 2*q(2)*q(2) - 2*q(4)*q(4), 2*q(3)*q(4) + 2*q(1)*q(2);
            2*q(2)*q(4) + 2*q(1)*q(3), 2*q(3)*q(4) - 2*q(1)*q(2), 1 - 2*q(2)*q(2) - 2*q(3)*q(3)];

end

