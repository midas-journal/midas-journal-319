%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: computeP.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% compute P with the comparison term
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function P =  computeP(u, myu_0, myu_1,pure_optiaml_mass_transport_ratio)

I1_I2_diff = zeros(size(myu_0,1),size(myu_0,2));
left_component = zeros(size(myu_0,1),size(myu_0,2),2);
middle_component = zeros(size(myu_0,1),size(myu_0,2),2);
right_component = zeros(size(myu_0,1),size(myu_0,2),2);
P = zeros(size(myu_0,1),size(myu_0,2),2);

[myu_0_x, myu_0_y] = gradient(myu_0);

myu_0(myu_0<1)=1;

for t1=1:size(myu_0,1)
    for t2=1:size(myu_0,2)
      x_location = min(size(myu_1,1),max(1,round(u(t1,t2,1))));
      y_location = min(size(myu_1,2),max(1,round(u(t1,t2,2))));
      I1_I2_diff(t1,t2) =  (myu_0(t1,t2)-myu_1(x_location,y_location))^2;
      left_component(t1,t2,:) = (1/(myu_0(t1,t2)^2))*I1_I2_diff(t1,t2)*[myu_0_x(t1,t2); myu_0_y(t1,t2)];
      middle_component(t1,t2,:) = (2/(myu_0(t1,t2)))*I1_I2_diff(t1,t2)*[myu_0_x(t1,t2); myu_0_y(t1,t2)];
      right_component(t1,t2,:) = 2*(pure_optiaml_mass_transport_ratio^2)*[u(t1,t2,1); u(t1,t2,2)];
      P(t1,t2,:) = left_component(t1,t2,:)+middle_component(t1,t2,:)+right_component(t1,t2,:);
 end
end