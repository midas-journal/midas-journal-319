%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: transform.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% deformes image_1 to image_0 (without intensity mixing)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function deformed_image = transform(u, image_1, square_edge_lenght)

u_image = compute_image_deformation_map(u, image_1, square_edge_lenght);
deformed_image = zeros(size(image_1,1),size(image_1,2));
for index_1 = 1:(size(image_1,1))
    for index_2 = 1:(size(image_1,2))
        x_location = min(max(1,round(u_image(index_1,index_2,1))),size(image_1,1));
        y_location = min(max(1,round(u_image(index_1,index_2,2))),size(image_1,2));
        deformed_image(index_1, index_2) = image_1(x_location,y_location);
    end
end

deformed_image = deformed_image(1:(size(image_1,1)-square_edge_lenght-4),1:(size(image_1,2)-square_edge_lenght-4));

