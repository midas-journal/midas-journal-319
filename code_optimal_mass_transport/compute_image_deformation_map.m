function u_image = compute_image_deformation_map(u_myu, image, square_edge_lenght)

u_image=[];

u_myu_index_x = 1;
u_myu_index_y = 1;

%intialization
for index_1 = 1:size(image,1)
    for index_2 = 1:(size(image,2))
            u_image(index_1,index_2,:) = [0;0];
    end
end

% update with the resulted u density map
for index_1 = 1:(size(u_myu,1))
    for index_2 = 1:(size(u_myu,2))
        x_location = 1+((u_myu(index_1,index_2,1)-1)*square_edge_lenght);
        y_location = 1+((u_myu(index_1,index_2,2)-1)*square_edge_lenght);
%         x_location = min(x_location, size(image,1));
%         y_location = min(y_location, size(image,2));
        u_image(1+((index_1-1)*square_edge_lenght),1+((index_2-1)*square_edge_lenght),:) = [x_location;y_location];
    end
end
% 

% u_image(1:9,1:9,2)

%do linear interpulation
upper_left_interpulation_node_location = [1, 1];
x_counter=1;
y_counter=1;


for index_1 = 1:(size(image,1)-square_edge_lenght)
    y_counter = 1;
    upper_left_interpulation_node_location(2) = 1;
    for index_2 = 1:(size(image,2)-square_edge_lenght)
        
        if (u_image(index_1,index_2,1)<eps)
        
            x_ratio_left = (index_1-upper_left_interpulation_node_location(1))/square_edge_lenght;
 
            x_location = (1-x_ratio_left)*u_image(upper_left_interpulation_node_location(1),upper_left_interpulation_node_location(2),1)...
            + (x_ratio_left)*u_image(upper_left_interpulation_node_location(1)+square_edge_lenght,upper_left_interpulation_node_location(2),1);
        
            y_ratio_left = (index_2-upper_left_interpulation_node_location(2))/square_edge_lenght;
        
            y_location = (1-y_ratio_left)*u_image(upper_left_interpulation_node_location(1),upper_left_interpulation_node_location(2),2)...
            + (y_ratio_left)*u_image(upper_left_interpulation_node_location(1),upper_left_interpulation_node_location(2)+square_edge_lenght,2);
        
            x_location = min(x_location, size(image,1));
            y_location = min(y_location, size(image,2));
            
            x_location = max(x_location, 1);
            y_location = max(y_location, 1);
        
            u_image(index_1,index_2,:) = [x_location;y_location];
            
        end
        
        y_counter = y_counter+1;
        % update the upper_left_interpulation_node
        if (y_counter>square_edge_lenght)
            upper_left_interpulation_node_location = upper_left_interpulation_node_location + [0, square_edge_lenght];
            y_counter = 1;
%             index_2
%             upper_left_interpulation_node_location
        end
        
    end
    
    x_counter = x_counter + 1;
    
     % update the upper_left_interpulation_node
    if (x_counter>square_edge_lenght)
        upper_left_interpulation_node_location = upper_left_interpulation_node_location + [square_edge_lenght, 0];
        x_counter = 1;
%         index_1
%         upper_left_interpulation_node_location
    end
end

%bounds completion - assuming little deformations
for index_1 = 1:size(image,1)
    for index_2 = 1:size(image,2)
        if (u_image(index_1,index_2,1)<eps)
            u_image(index_1,index_2,:) = [index_1;index_2];
        end
    end
end

