%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: compute_gradient.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% compute the gradient of a map v
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function gradient_res = compute_gradient(v)

gradient_res = zeros(size(v,1),size(v,2),2);

for (tx=2:(size(v,1)-1))
    for (ty=2:(size(v,2)-1))
        dv_dx = (v(tx+1,ty)-v(tx-1,ty))/2;
        dv_dy = (v(tx,ty+1)-v(tx,ty-1))/2;
        gradient_res(tx,ty,1) = dv_dx;
        gradient_res(tx,ty,2) = dv_dy;
    end
end
