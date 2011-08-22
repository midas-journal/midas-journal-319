function size_ut = compute_mean_deformation_size(v, u)

size_ut = 0;

% tmp =  size(v)
number_of_vectors=1;
for (tx=2:(size(v,1)-1))
    for (ty=2:(size(v,2)-1))
        size_ut = size_ut + ((v(tx,ty,1)-u(tx,ty,1))^2+(v(tx,ty,2)-u(tx,ty,2))^2)^0.5;
        number_of_vectors = number_of_vectors+1;
    end
end
% size_ut
% number_of_vectors
size_ut = size_ut/number_of_vectors; %((size(v,1)^2)*(size(v,2)^2));