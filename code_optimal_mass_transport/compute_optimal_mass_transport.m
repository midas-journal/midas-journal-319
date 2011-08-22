%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: compute_optimal_mass_transport.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% This method computes the optimal mass transport (maybe with a comparison term)
% After reading the images and computing an initial map, it call to the gradient descent method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function u = compute_optimal_mass_transport (image_file_name_0, type0, image_file_name_1, type1, square_edge_lenght, P_type, equalization_method)
% close all;
% constants
% initially, the images are devided into equal-size squares, this parameter determines the squares edge lenght (in pixels)

% read images and convert to gray scale 
image_0 = imread_to_gray(image_file_name_0, type0);
image_1 = imread_to_gray(image_file_name_1, type1);

% modify the density maps such that their sum is equal.
if (equalization_method==0)
    image_0 = (sum(sum(image_1))/sum(sum(image_0)))*image_0;
elseif (equalization_method==1)
    image_0 = histeq(image_0);
    image_1 = histeq(image_1);
else
    error('not a valid equalization_method value');
end

%check same total mass assumption
if (sum(sum(image_0)) - sum(sum(image_1)))
    disp('the total mass is the same');
end

myu_0 = compute_density_map(image_0,square_edge_lenght);
myu_1 = compute_density_map(image_1,square_edge_lenght);

u0 = compute_initial_mapping(myu_0, myu_1);

% type == 1 is for pure optimal transport measurement
u = gradient_descent(u0, myu_0, myu_1,square_edge_lenght,P_type);