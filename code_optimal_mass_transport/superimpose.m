%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: superimpose.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% Superimpose a deformation map on an image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = superimpose(u, image, square_edge_lenght)

for index_1 = 1:size(u,1)
    for index_2 = 1:size(u,2)
        y_location = floor(u(index_1,index_2,1)*square_edge_lenght);
        x_location = floor(u(index_1,index_2,2)*square_edge_lenght);
        image(x_location,y_location)=0;
    end
end

figure;
imshow(image)
