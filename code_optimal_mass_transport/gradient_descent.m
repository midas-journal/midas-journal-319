%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: gradient_descent.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% Iteratively computes the optimal mass transport
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function u =  gradient_descent(u0, myu_0, myu_1, square_edge_lenght, type)

% initialization size(u0)
current_u=u0;
ut=u0;
last_ut=zeros(size(ut,1),size(ut,2),2);
for tx=1:size(ut,1)
    for ty=1:size(ut,2)
        ut(tx,ty,:)=[0 0];
        current_u(tx,ty,1)=u0(tx,ty,1)-tx ;
         current_u(tx,ty,2)=u0(tx,ty,2)-ty;
    end
end


iteration_number=1;

stop_flag = 0; 
maximum_number_of_iterations = 8;
pure_optiaml_mass_transport_ratio = 0.3;
convergance_threshold = 0.01;

% The gradient descent method
while ((stop_flag==0) & (iteration_number<=maximum_number_of_iterations))
    [ut,alpha] = compute_ut(current_u, myu_0, myu_1, square_edge_lenght, type, pure_optiaml_mass_transport_ratio);
    
    current_u = current_u - alpha*ut;
    iteration_number = iteration_number + 1;
   
    size_ut=compute_mean_deformation_size(ut, last_ut);
    if (abs(size_ut)<convergance_threshold)
        stop_flag=1;
    end
    last_ut = ut;
end

if (stop_flag==1)
    disp('stoped: ut is associated with small deformations');
else
    disp('stoped: achieved maximum number of iterations');
end

u=current_u;
for tx=1:size(ut,1)
    for ty=1:size(ut,2)
        u(tx,ty,1) = tx+current_u(tx,ty,1) ;
        u(tx,ty,2) = ty+current_u(tx,ty,2) ;
    end
end