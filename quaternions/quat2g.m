function gamma  = quat2g(q)
    % Gamma mapping function from angular velocity to quaternion rates
    q = normalize(q, 'norm');
    gamma = 0.5*[       -q(2) 	-q(3)   -q(4);
                     	q(1)    -q(4)   q(3);
                    	q(4)    q(1)    -q(2);
                      	-q(3)   q(2)    q(1)];
end
