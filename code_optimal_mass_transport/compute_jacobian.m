%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: compute_jacobian.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% compute the jacobian of a map v
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function jacobian_u = compute_jacobian(v)

% assuming diagonal jacobian matrix
jacobian_u = zeros(size(v,1),size(v,2),2);

for (tx=2:(size(v,1)-1))
    for (ty=2:(size(v,2)-1))
        dv_dx = (v(tx+1,ty,1)-v(tx-1,ty,1))/2;
        dv_dy = (v(tx,ty+1,2)-v(tx,ty-1,2))/2;
        jacobian_u(tx,ty,1) = dv_dx;
        jacobian_u(tx,ty,2) = dv_dy;
    end
end