function res = create_test_images ()
close all;

factor =3;
shift=-0;
angles_vector = ((1+shift):factor:(360+shift)*factor)*(pi/180);
% create images to test the initial computation u0

% create images to test a0
% create the first image
tmp_x = (sin(angles_vector)+1)/2;
ones_vector = ones(size(tmp_x,2),1);


image_test_u0_ax_1 = ones_vector*tmp_x;
figure;
imshow(image_test_u0_ax_1);
imwrite(image_test_u0_ax_1,'test_u0_ax_1.bmp','bmp');

factor = 3;
shift=-35;
angles_vector = ((1+shift):factor:(360+shift)*factor)*(pi/180);

% create the second image
tmp_x = (sin(angles_vector)+1)/2;
ones_vector = ones(size(tmp_x,2),1);
image_test_u0_ax_2 = ones_vector*tmp_x;
figure;
imshow(image_test_u0_ax_2);
imwrite(image_test_u0_ax_2,'test_u0_ax_2.bmp','bmp');

% create images to test b0
factor =3;
shift=-0;
angles_vector = ((1+shift):factor:(360+shift)*factor)*(pi/180);
% create images to test the initial computation u0

% create the first image
tmp_y = (sin(angles_vector)+1)/2;
ones_vector = ones(size(tmp_y,2),1);


image_test_u0_ay_1 = tmp_y'*ones_vector';
figure;
imshow(image_test_u0_ay_1);
imwrite(image_test_u0_ay_1,'test_u0_bxy_1.bmp','bmp');

factor = 3;
shift=25;
angles_vector = ((1+shift):factor:(360+shift)*factor)*(pi/180);

% create the second image
tmp_y = (sin(angles_vector)+1)/2;
ones_vector = ones(size(tmp_y,2),1);
image_test_u0_ay_2 = tmp_y'*ones_vector';
figure;
imshow(image_test_u0_ay_2);
imwrite(image_test_u0_ay_2,'test_u0_bxy_2.bmp','bmp');


% create images to test method
x_center_0 = 50;
y_center_0 = 70;
image_0_hill = zeros(256,256);

x_center_1 = 200;
y_center_1 = 190;
image_1_hill = zeros(256,256);

for tx=1:256
    for ty=1:256
        image_0_hill(tx,ty) = max(0, 1-6*((x_center_0-tx)^2+(y_center_0-ty)^2)/(2*(256^2)));
        image_1_hill(tx,ty) = max(0,1-6*((x_center_1-tx)^2+(y_center_1-ty)^2)/(2*(256^2)));
    end
end
figure;
imshow(image_0_hill);
imwrite(image_0_hill,'test_hill_0.bmp','bmp');

figure;
imshow(image_1_hill);
imwrite(image_1_hill,'test_hill_1.bmp','bmp');
