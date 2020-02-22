function phi = rotationinv(dcm)
%ROTATIONINV Rotation Inverse Mapping
%   Returns a rotation vector from a dcm.
%   This carries out the inverse mapping from SO(3) to so(3), 
%   See AER1513 Course slides: lec9.pdf, pp. 42

axang = vrrotmat2vec(dcm);

phi = axang(end)*reshape(axang(1:3), [3,1]);
end

