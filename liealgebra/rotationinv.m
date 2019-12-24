function phi = rotinv(dcm)
%ROTATIONINV Rotation Inverse Mapping
%   Returns a rotation vector from a dcm.
axang = vrrotmat2vec(dcm);

phi = axang(end)*reshape(axang(1:3), [3,1]);
end

