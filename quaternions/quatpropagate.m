function out = quatpropagate(w, q ,dt)
%Q_PROP Propagates quaternions through to the next discrete timestep
%   omega is the angular velocity at previous timestep, T is the time
%   interval;

    eps = 0.00001;
    if norm(w) < eps && norm(w)> -eps
        out = [1 0 0 0];
    else
        rate = norm(w);
        axis = reshape(normalize(w, 'norm'), [1,3]);
        d_q = [ cos(rate*dt/2) axis*sin(rate*dt/2)];
        out = quatprod(d_q, q);
    end
end

