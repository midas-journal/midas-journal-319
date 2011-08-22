%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: compute_ut.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% Compute the gradient of u, denoted as ut, with or without a comparison term
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ut, alpha] = compute_ut(current_u, myu_0, myu_1, square_edge_lenght, type, pure_optiaml_mass_transport_ratio)


if (type==0)
    P = current_u;
elseif (type==1)
    P = computeP(current_u, myu_0, myu_1, pure_optiaml_mass_transport_ratio);
else
    error('not a valid Ut computation type - should be 1 for u and 2 for a comparison term based measure')
end

P = rotate_data(P);

div_P = compute_devergance(P);


n1 = size(div_P,1);
n2 = size(div_P,2);


minus_div_P = -1*(reshape(div_P, n1*n2,1));

% Solve poisson's equation
f = poicalc(minus_div_P,square_edge_lenght,square_edge_lenght,n1,n2);
% f = poicalc(minus_div_P,1,1,n1,n2);

f = reshape(f, n1,n2);

gradient_f = compute_gradient(f);

gradient_f = rotate_data(gradient_f);

Du = compute_jacobian(current_u);

[ut, alpha] = mult_components(myu_0, Du, gradient_f);

