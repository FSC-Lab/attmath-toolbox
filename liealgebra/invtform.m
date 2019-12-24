function inv = invtform(tform)
%INVTFORM Inverse transformation matrix
%   Returns the inverse of a transformation matrix

dcm = tform(1:3,1:3);
r = tform(1:3,4);
inv = [dcm', -dcm'*r; zeros(1,3),1];
end

