%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: compute_devergance.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% compute the divergance of a map v
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function divergance_res = compute_devergance(v)

divergance_res = zeros(size(v,1),size(v,2));

for (tx=2:(size(v,1)-1))
    for (ty=2:(size(v,2)-1))
        dv_dx = (v(tx+1,ty,2)-v(tx-1,ty,2))/2;
        dv_dy = (v(tx,ty+1,1)-v(tx,ty-1,1))/2;
        divergance_res(tx,ty) = dv_dx + dv_dy;
    end
end
