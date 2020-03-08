function M = quat2mat(Q, axis)
%QUAT2MAT Quaternion to rotation matrix conversion
%   M = quat2mat(Q) produces a rotation matrix M equivalent
%   to the quaternion Q. Input quaternion is of convention wxyz, i.e.
%   scalar in the first element. Output rotation matrix is premultiplied
%
%   M = quat2mat(Q) if Q is of size 4xN or Nx4 produces a stack of rotation
%   matrices M with size 3x3xN
%
%   M = quat2mat(Q, axis) if Q is of size 4x4 produces a stack of rotation
%   matrices M with size 3x3x4, reading in rows of quaternions if axis is 0
%   or columns of quaternions if axis is 2

ax = 0;
if nargin > 1
    ax = axis;
end
[r, c] = size(Q);

if r == 4 && c == 4 && ax == 0
    error('Cannot distinguish which axis contains data in symmetric input array. Specify axis');
elseif r > 4 && c > 4
    error('Dimension of both axes of input array are greater than 4');
elseif c > 1 && r == 4 || ax == 2
    M = zeros(3,3,c);
    for i = 1:c
        M(:,:,i) = quat2mat(Q(:,i));
    end
elseif c == 4 && r > 1 || ax == 1
    M = zeros(3,3,r);
    for i = 1:r
        M(:,:,i) = quat2mat(Q(i,:));
    end
else
    if abs(norm(Q) - 1) > 1e-5
        Q = Q / norm(Q);
    end

    M = [ 1 - 2*Q(3)*Q(3) - 2*Q(4)*Q(4), 2*Q(2)*Q(3) + 2*Q(1)*Q(4), 2*Q(2)*Q(4) - 2*Q(1)*Q(3);
            2*Q(2)*Q(3) - 2*Q(1)*Q(4), 1 - 2*Q(2)*Q(2) - 2*Q(4)*Q(4), 2*Q(3)*Q(4) + 2*Q(1)*Q(2);
            2*Q(2)*Q(4) + 2*Q(1)*Q(3), 2*Q(3)*Q(4) - 2*Q(1)*Q(2), 1 - 2*Q(2)*Q(2) - 2*Q(3)*Q(3)];
end

end

