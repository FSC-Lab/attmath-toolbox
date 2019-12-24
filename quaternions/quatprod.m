function qout = quatprod(q1,q2)
%QUATPROD Calculate the product of two quaternions.


% Calculate vector portion of quaternion product
% vec = s1*v2 + s2*v1 + cross(v1,v2)
vec =   [   q1(1).*q2(2); 
            q1(1).*q2(3); 
            q1(1).*q2(4)] + ...
        [   q2(1).*q1(2); 
            q2(1).*q1(3); 
            q2(1).*q1(4)] +...
        [   q1(3).*q2(4)-q1(4).*q2(3);
            q1(4).*q2(2)-q1(2).*q2(4);
            q1(2).*q2(3)-q1(3).*q2(2)];

% Calculate scalar portion of quaternion product
% scalar = s1*s2 - dot(v1,v2)
scalar = q1(1).*q2(1) - q1(2).*q2(2) - ...
             q1(3).*q2(3) - q1(4).*q2(4);
    
qout = [scalar;  vec];
       
end

