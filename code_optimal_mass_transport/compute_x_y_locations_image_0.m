function [x_location_at_image_0, y_location_at_image_0] = compute_x_y_locations_image_0(u, image_0, square_edge_lenght)


    
x_location = 

for index_1 = 1:size(u,2)
        x_location = floor(u(2, index_1)*square_edge_lenght);
        image(x_location,y_location)=0;
    end
end
for index_2 = 1:size(u,2)
        y_location = floor(u(1, index_1)*square_edge_lenght);
        x_location = floor(u(2, index_2)*square_edge_lenght);
        image(x_location,y_location)=0;
    end