%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: create_image_series.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% Create a series of warped images between image_0 and image_1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = create_image_series(optimal_u, image_0,image_1, square_edge_lenght,number_of_frames)

result = zeros(size(image_1,1), size(image_1,2), number_of_frames);

delta_u=optimal_u;
for tx=1:(size(delta_u,1))
    for ty=1:(size(delta_u,2))
        delta_u(tx,ty,1) = (optimal_u(tx,ty,1)-tx)/number_of_frames;
        delta_u(tx,ty,2) = (optimal_u(tx,ty,2)-ty)/number_of_frames;
    end
end

figure;

for (current_frame_number=number_of_frames:-1:1)
    result = transform_intensity(optimal_u-((current_frame_number-1)*delta_u), image_0, image_1, square_edge_lenght, current_frame_number/number_of_frames);   
    subplot(1,number_of_frames,current_frame_number);
    imshow(result);
end
    