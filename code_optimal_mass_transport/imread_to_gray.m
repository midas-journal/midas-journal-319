%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: imread_to_gray.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% Reads an image and convert it to a double precision grey level image.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function image = imread_to_gray(image_file_name, type)

[tmp_image, map] = imread(image_file_name, type);

tmp_image = tmp_image;


if isind(tmp_image)
   % disp('indexed image');
    image = ind2gray(tmp_image, map);
elseif isrgb(tmp_image)
   % disp('RGB image');
    image = rgb2gray(tmp_image);
else
    image = double(tmp_image);
end

image = double(image);


image = (image+min(min(image)))/max(max(image));

image_size = min(size(image));
image = image(1:image_size,1:image_size);

