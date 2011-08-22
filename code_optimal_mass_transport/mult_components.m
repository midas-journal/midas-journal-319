function [ut, alpha] = mult_components(myu0, Du, gradient_f)

ut = zeros(size(Du,1),size(Du,2),2);
tmp_for_alpha = zeros(size(Du,1),size(Du,2),2);

myu0(myu0<1)=1;

% size(myu0)
% size(Du)
% size(gradient_f)

for (tx=2:(size(Du,1)-1))
    for (ty=2:(size(Du,2)-1))
        ut(tx,ty,1) = (1/myu0(tx,ty))*Du(tx,ty,1)*gradient_f(tx,ty,1);
        ut(tx,ty,2) = (1/myu0(tx,ty))*Du(tx,ty,2)*gradient_f(tx,ty,2);
        
        tmp_for_alpha(tx,ty,1) = (1/myu0(tx,ty))*gradient_f(tx,ty,1);
        tmp_for_alpha(tx,ty,2) = (1/myu0(tx,ty))*gradient_f(tx,ty,2);
    end
end

tmp_for_alpha(tmp_for_alpha==0)=eps;
alpha = 0.5*min(min(min(1./abs(tmp_for_alpha))));