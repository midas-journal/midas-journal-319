%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: run_tests.m
% Author: Ruby Shamir, rubke@cs.huji.ac.il
%
% Description
% experimental setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% test types key
%
% 1 - test intial MP u with respect to b(x,y)
% 2 - test intial MP u with respect to a(x)
% 3 - test intial MP u with respect to a(x) use another integral equalization method
% 4 - create deformed images series between two input images: flame (inludes intensity mixture)
% 5 - create deformed images series between two input images: clouds (inludes intensity mixture)
% 6 - create deformed images series between two input images: water (inludes intensity mixture)
% 7 - deform one cloud image to the other without intensity mixture - test "same total" methods

function result = run_tests(test_type)

close all;

%%%%%%% test initial computation uo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if test_type==1
    
%initially, the images are devided into equal-size squares, this parameter determines the squares edge lenght (in pixels)
square_edge_lenght = 12;

% read images and convert to gray scale 
image_0 = imread_to_gray('test_u0_ax_1.bmp', 'bmp');
image_1 = imread_to_gray('test_u0_ax_2.bmp', 'bmp');

myu_0 = compute_density_map(image_0,square_edge_lenght);
myu_1 = compute_density_map(image_1,square_edge_lenght);

 u0 = compute_initial_mapping(myu_0, myu_1);

 
 load('u0_check.mat');
 figure;
 plot(a_integral_myu_0,'+');
 hold on;
 plot(a_integral_myu_1,'o');
 xlabel('a(x)')
 ylabel('integral value')
 text(2,350,'+ is for myu0 integral; o is for myu1 integral')
 
 figure;
 plot(b_integral_myu_0,'+');
 hold on;
 plot(b_integral_myu_1,'o');
 xlabel('b(x,y)')
 ylabel('integral value')
 text(2,350,'+ is for myu0 integral; o is for myu1 integral')
 

 deformed_image = transform(u0, image_1, square_edge_lenght);


 image_1 = image_1(1:(size(image_1,1)-square_edge_lenght),1:(size(image_1,2)-square_edge_lenght-4));
 image_0 = image_0(1:(size(image_0,1)-square_edge_lenght),1:(size(image_0,2)-square_edge_lenght-4));

 figure;
 subplot(1,3,1);
 imshow(image_1);
 title('image 1');
 subplot(1,3,2);
 imshow(deformed_image);
 title('deformed image: from 1 to 0');
 subplot(1,3,3);
 imshow(image_0);
 title('image 0');


elseif test_type==2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % initially, the images are devided into equal-size squares, this parameter determines the squares edge lenght (in pixels)
square_edge_lenght = 16;

% read images and convert to gray scale 
image_0 = imread_to_gray('test_u0_bxy_2.bmp', 'bmp');
image_1 = imread_to_gray('test_u0_bxy_1.bmp', 'bmp');


myu_0 = compute_density_map(image_0,square_edge_lenght);
myu_1 = compute_density_map(image_1,square_edge_lenght);
    
u0 = compute_initial_mapping(myu_0, myu_1);

 load('u0_check.mat');
 figure;
 plot(a_integral_myu_0,'+');
 hold on;
 plot(a_integral_myu_1,'o');
 xlabel('a(x)')
 ylabel('integral value')
 text(2,220,'+ is for myu0 integral; o is for myu1 integral')
 
 figure;
 plot(b_integral_myu_0,'+');
 hold on;
 plot(b_integral_myu_1,'o');
 xlabel('b(x,y)')
 ylabel('integral value')
 text(2,220,'+ is for myu0 integral; o is for myu1 integral')
 
image_0 = imread_to_gray('test_u0_bxy_2.bmp', 'bmp');
image_1 = imread_to_gray('test_u0_bxy_1.bmp', 'bmp');
 
deformed_image = transform(u0, image_1, square_edge_lenght);

image_1 = image_1(1:(size(image_1,1)-square_edge_lenght),1:(size(image_1,2)-square_edge_lenght-4));
image_0 = image_0(1:(size(image_0,1)-square_edge_lenght),1:(size(image_0,2)-square_edge_lenght-4));

figure;
subplot(1,3,1);
imshow(image_1);
title('image 1');
subplot(1,3,2);
imshow(deformed_image);
title('deformed image: from 1 to 0');
subplot(1,3,3);
imshow(image_0);
title('image 0');


elseif test_type==3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % initially, the images are devided into equal-size squares, this parameter determines the squares edge lenght (in pixels)
square_edge_lenght = 16;

% read images and convert to gray scale 
image_0 = imread_to_gray('test_u0_bxy_2.bmp', 'bmp');
image_1 = imread_to_gray('test_u0_bxy_1.bmp', 'bmp');


% modify the density maps such that their sum is equal.
image_0 = histeq(image_0);
image_1 = histeq(image_1);

myu_0 = compute_density_map(image_0,square_edge_lenght);
myu_1 = compute_density_map(image_1,square_edge_lenght);

    
u0 = compute_initial_mapping(myu_0, myu_1);

 load('u0_check.mat');
 figure;
 plot(a_integral_myu_0,'+');
 hold on;
 plot(a_integral_myu_1,'o');
 xlabel('a(x)')
 ylabel('integral value')
 text(2,220,'+ is for myu0 integral; o is for myu1 integral')
 
 
 figure;
 plot(b_integral_myu_0,'+');
 hold on;
 plot(b_integral_myu_1,'o');
  xlabel('b(x,y)')
 ylabel('integral value')
 text(2,220,'+ is for myu0 integral; o is for myu1 integral')
 
image_0 = imread_to_gray('test_u0_bxy_2.bmp', 'bmp');
image_1 = imread_to_gray('test_u0_bxy_1.bmp', 'bmp');
 
deformed_image = transform(u0, image_1, square_edge_lenght);

image_1 = image_1(1:(size(image_1,1)-square_edge_lenght),1:(size(image_1,2)-square_edge_lenght-4));
image_0 = image_0(1:(size(image_0,1)-square_edge_lenght),1:(size(image_0,2)-square_edge_lenght-4));

figure;
subplot(1,3,1);
imshow(image_1);
title('image 1');
subplot(1,3,2);
imshow(deformed_image);
title('deformed image: from 1 to 0');
subplot(1,3,3);
imshow(image_0);
title('image 0');

    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif test_type==4
    
    square_edge_lenght = 2;
    P_type = 1;
     equalization_method =0; 
    optimal_u = compute_optimal_mass_transport ('flame_2.bmp', 'bmp','flame_1.bmp', 'bmp', square_edge_lenght, P_type,equalization_method);
    
    image_0 = imread_to_gray('flame_2.bmp', 'bmp');
    image_1 = imread_to_gray('flame_1.bmp', 'bmp');
    
    number_of_frames = 6;
    create_image_series(optimal_u, image_0, image_1, square_edge_lenght,number_of_frames);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
elseif test_type==5
    
    square_edge_lenght = 4;
    P_type = 1;
     equalization_method =0; 
    optimal_u = compute_optimal_mass_transport ('cloud_2.bmp', 'bmp','cloud_1.bmp', 'bmp', square_edge_lenght, P_type,equalization_method);
    
    image_0 = imread_to_gray('cloud_2.bmp', 'bmp');
    image_1 = imread_to_gray('cloud_1.bmp', 'bmp');
    
    number_of_frames = 6;
    create_image_series(optimal_u, image_0, image_1, square_edge_lenght,number_of_frames);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif test_type==6
    
    square_edge_lenght = 2;
    P_type = 1;
     equalization_method =0; 
    optimal_u = compute_optimal_mass_transport ('water_1.jpg', 'jpg','water_2.jpg', 'jpg', square_edge_lenght, P_type,equalization_method);
    
    image_0 = imread_to_gray('water_1.jpg', 'jpg');
    image_1 = imread_to_gray('water_2.jpg', 'jpg');
    
    number_of_frames = 6;
    create_image_series(optimal_u, image_0, image_1, square_edge_lenght,number_of_frames);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif test_type==7
    square_edge_lenght = 4;
    P_type = 1;
    
    equalization_method = 0;% addition of the integrals ratio
    optimal_u = compute_optimal_mass_transport ('cloud_1.bmp', 'bmp', 'cloud_2.bmp', 'bmp', square_edge_lenght, P_type, equalization_method);
    
    image_0 = imread_to_gray('cloud_1.bmp', 'bmp');
    image_1 = imread_to_gray('cloud_2.bmp', 'bmp');
    
    deformed_image = transform(optimal_u, image_1, square_edge_lenght);

    image_1 = image_1(1:(size(image_1,1)-square_edge_lenght),1:(size(image_1,2)-square_edge_lenght-4));
    image_0 = image_0(1:(size(image_0,1)-square_edge_lenght),1:(size(image_0,2)-square_edge_lenght-4));

    figure;
    subplot(1,3,1);
    imshow(image_1);
    title('image 1');
    subplot(1,3,2);
    imshow(deformed_image);
    title('deformed image: from 1 to 0');
    subplot(1,3,3);
    imshow(image_0);
    title('image 0');
    
    equalization_method =1; % for histeq
    optimal_u = compute_optimal_mass_transport ('cloud_1.bmp', 'bmp', 'cloud_2.bmp', 'bmp', square_edge_lenght, P_type, equalization_method);
    
    image_0 = imread_to_gray('cloud_1.bmp', 'bmp');
    image_1 = imread_to_gray('cloud_2.bmp', 'bmp');
    
    deformed_image = transform(optimal_u, image_1, square_edge_lenght);

    image_1 = image_1(1:(size(image_1,1)-square_edge_lenght),1:(size(image_1,2)-square_edge_lenght-4));
    image_0 = image_0(1:(size(image_0,1)-square_edge_lenght),1:(size(image_0,2)-square_edge_lenght-4));

    figure;
    subplot(1,3,1);
    imshow(image_1);
    title('image 1');
    subplot(1,3,2);
    imshow(deformed_image);
    title('deformed image: from 1 to 0');
    subplot(1,3,3);
    imshow(image_0);
    title('image 0');
else
    error('not a valid test number');
end

clear all;