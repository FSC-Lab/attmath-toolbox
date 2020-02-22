function adj = adjtform(tform)
%POSEADJ Adjoint Pose
%   Returns adjoint of an element of SE(3) or transformation matrix.
%   This operator is Ad(SE(3))
%   See AER1513 Course slides: lec9.pdf, pp. 47

dcm = tform(1:3,1:3);
r = tform(1:3,4);
adj = [dcm, hat(r)*dcm;
       zeros(3), dcm];
end

