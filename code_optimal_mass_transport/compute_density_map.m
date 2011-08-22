%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: compute_density_map.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% divide an input image into bloks of a predefined size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function myu = compute_density_map(image, square_edge_lenght)

% compute the density maps

myu = zeros(floor((size(image,1))/square_edge_lenght),floor((size(image,2))/square_edge_lenght));

for index_x = 1:square_edge_lenght:(size(image,1)-square_edge_lenght)
    for index_y = 1:square_edge_lenght:(size(image,2)-square_edge_lenght)
        myu(1+((index_x-1)/square_edge_lenght),1+((index_y-1)/square_edge_lenght))=...
            sum(sum(image((index_x:(index_x+square_edge_lenght-1)),(index_y:(index_y+square_edge_lenght-1)))))/(square_edge_lenght^2);
    end
end
