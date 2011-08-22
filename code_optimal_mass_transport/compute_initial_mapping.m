%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: compute_initial_mapping.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% This method computes an initial mapping that preserves the mass between
% two density distribution maps
% The method iteratively solves the Monge-Kantorovich problem for 1-D
% at first for the x-axis and then for the y-axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function u0 = compute_initial_mapping(myu_0, myu_1)


a = zeros(1, size(myu_0,1));
a_integral_myu_0 = zeros(1, size(myu_0,1));
a_integral_myu_1 = zeros(1, size(myu_0,1));
integral_myu_x_0 = 0;
integral_myu_x_1 = 0;;

% solve the Monge-Kantorovich problem for the x-axis

% this parameter is used to correct integral overshoots
first_integral_correction = 0;

% index 1 is the x in the integral of myu 1
index_1=1; %

% index 0 is the a(x) in the integral of myu 0
for index_0 = 1:size(myu_0,1)
    
    % compute the integral to this point of a(x)
    integral_myu_x_0 = integral_myu_x_0 + sum(myu_0(index_0,:));
    
    last_index_1 = index_1;
    % find the x that yelds a similar value
    while ((integral_myu_x_1 < integral_myu_x_0) & (index_1<=size(myu_1,1)))
      integral_myu_x_1 = integral_myu_x_1 + sum(myu_1(index_1,:));
      index_1 = index_1 + 1;
    end  
    
    % correct in case of overshooting
    if ((index_1<size(myu_1,1)) & ((index_1-last_index_1)>eps))
        index_1 = index_1 - 1;
        integral_myu_x_1 = integral_myu_x_1 - sum(myu_1(max(1,index_1),:));
        
    else % finished because end of vector
        if (first_integral_correction==1)
            integral_myu_x_0 = integral_myu_x_0 - sum(myu_0(index_0,:));
        else
            first_integral_correction=1;
        end
    end
    
    a_integral_myu_0(index_0)=integral_myu_x_0;
    a_integral_myu_1(index_0)=integral_myu_x_1;
    
    a(index_0) = index_1;
end

% solve the Monge-Kantorovich problem for the y-axis

% initializations
b = zeros(1, size(myu_0,2));
integral_myu_y_0 = 0;
b_integral_myu_0 = zeros(1, size(myu_0,2));
b_integral_myu_1 = zeros(1, size(myu_0,2));
integral_myu_y_1 = 0;
% this parameter is used to correct integral overshoots
first_integral_correction = 0;

% index 1 is the y in the integral of myu 1
index_1=1;
% index 0 is the b(x,y) in the integral of myu 0
for index_0 = 1:size(myu_0,2)
    
    % compute the integral to this point of b(x,y)
    integral_myu_y_0 = integral_myu_y_0 + sum(myu_0(:,index_0));
    
    last_index_1=index_1;
    % find the y that yelds a similar value
    while ((integral_myu_y_1 < integral_myu_y_0) & (index_1<=size(myu_1,2)))
      integral_myu_y_1 = integral_myu_y_1 + sum(myu_1(:,index_1));
      index_1 = index_1 + 1;
    end
    
    % correct in case of overshooting
    if ((index_1<size(myu_1,2))  & ((index_1-last_index_1)>eps))
        index_1 = index_1 - 1;
        integral_myu_y_1 = integral_myu_y_1 - sum(myu_1(:,max(1,index_1)));
    else
        if (first_integral_correction==1)
            integral_myu_y_0 = integral_myu_y_0 - sum(myu_0(:,index_0));
        else
            first_integral_correction=1;
        end
    end
    
    b_integral_myu_0(index_0)=integral_myu_y_0;
    b_integral_myu_1(index_0)=integral_myu_y_1;
    
    b(index_0) = index_1;
end

u0=[];


for index_1=1:size(a,2)
    for index_2=1:size(b,2)
        u0(index_1,index_2,1) = a(index_1);
        u0(index_1,index_2,2) = b(index_2);
    end
end

save('u0_check.mat','b_integral_myu_0','b_integral_myu_1','a_integral_myu_0','a_integral_myu_1');