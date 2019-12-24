function adj = adjtform(tform)
%POSEADJ Transformation matrix adjoint
%   Returns adjoint of a transformation matrix
dcm = tform(1:3,1:3);
r = tform(1:3,4);
adj = [dcm hat(r)*dcm;
       zeros(3) dcm];
end

