%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: rotate_res.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% Rotate the map 90 deg. counterclock direction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function rotate_res = rotate_data(v);

rotate_res = zeros(size(v,1),size(v,2),size(v,3));

rotate_res(:,:,1) = -v(:,:,2);
rotate_res(:,:,2) = v(:,:,1);