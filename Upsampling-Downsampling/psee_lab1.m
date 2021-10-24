clear all;
close all;
clc;

image = imread('cameraman.tif');
[N,M]=size(image) % the size of the matrix
figure,imshow(image);
title('Original image');


%-----------------   parameter 1/2 ---------------------------

image_down2_anti_false= imresize(image, 1/2,'Antialiasing',false); 
figure, imshow(image_down2_anti_false);
title('scale 1/2, aliasing');

image_down2_anti = imresize(image, 1/2,'Antialiasing',true);
figure,imshow(image_down2_anti);
title('scale 1/2, anti-aliasing');

%--------------------parameter 1/4-----------------------------------------

image_down4_anti_false= imresize(image, 1/4,'Antialiasing',false);
figure, imshow(image_down4_anti_false);
title('scale 1/4, aliasing');

image_down4_anti = imresize(image, 1/4,'Antialiasing',true);
figure,imshow(image_down4_anti);
title('scale 1/4, anti-aliasing');
%---------------------------------parameter 1/8----------------------------

image_down8_anti_false= imresize(image, 1/8','Antialiasing',false);
figure, imshow(image_down8_anti_false);
title('scale 1/8, aliasing');

image_down8_anti = imresize(image, 1/8,'Antialiasing',true);
figure,imshow(image_down8_anti);
title('scale 1/8, anti-aliasing');



%--------------- UPSAMPLE -------------------

%------------------------ parameter 1/2----------------------------


image_2_nearest_anti_false_UP = imresize(image_down2_anti_false,[N,M],'nearest','Antialiasing',false);
size(image_2_nearest_anti_false_UP) % the size of the matrix
figure,imshow(image_2_nearest_anti_false_UP);
title('Upsamled image, scale 2, nearest neighbor, aliasing');

image_2_nearest_anti_UP = imresize(image_down2_anti,[N,M],'nearest','Antialiasing',true);
size(image_2_nearest_anti_UP) % the size of the matrix
figure,imshow(image_2_nearest_anti_UP);
title('Upsamled image, scale 2, nearest neighbor, anti-aliasing');

%------------------------------
image_2_bilinear_anti_false_UP = imresize(image_down2_anti_false,[N,M],'bilinear','Antialiasing',false);
size(image_2_bilinear_anti_false_UP) % the size of the matrix
figure,imshow(image_2_bilinear_anti_false_UP);
title('Upsamled image from scale 1/2, bilirear, aliasing');

image_2_bilinear_anti_UP = imresize(image_down2_anti,[N,M],'bilinear','Antialiasing',true);
size(image_2_bilinear_anti_UP) % the size of the matrix
figure,imshow(image_2_bilinear_anti_UP);
title('Upsamled image from scale 1/2, bilenear, antialiasing');
%----------------------------------------
image_2_bicubic_anti_false_UP = imresize(image_down2_anti_false,[N,M],'bicubic','Antialiasing',false);
size(image_2_bicubic_anti_false_UP) % the size of the matrix
figure,imshow(image_2_bicubic_anti_false_UP);
title('Upsamled image from scale 1/2, bicubic, aliasing');

image_2_bicubic_anti_UP = imresize(image_down2_anti,[N,M],'bicubic','Antialiasing',true);
size(image_2_bicubic_anti_UP) % the size of the matrix
figure,imshow(image_2_bicubic_anti_UP);
title('Upsamled image from scale 1/2, bicubic, antialiasing');



%-----------    paremeter 1/4   -------------------------------------------------
image_4_nearest_anti_false_UP = imresize(image_down4_anti_false,[N,M],'nearest','Antialiasing',false);
size(image_4_nearest_anti_false_UP) % the size of the matrix
figure,imshow(image_4_nearest_anti_false_UP);
title('Upsamled image from scale 1/4, nearest neighbor, aliasing');

image_4_nearest_anti_UP = imresize(image_down4_anti,[N,M],'nearest','Antialiasing',true);
size(image_4_nearest_anti_UP) % the size of the matrix
figure,imshow(image_4_nearest_anti_UP);
title('Upsamled image from scale 1/4, nearest neighbor, antialiasing');

%------------------------------
image_4_bilinear_anti_false_UP = imresize(image_down4_anti_false,[N,M],'bilinear','Antialiasing',false);
size(image_4_bilinear_anti_false_UP) % the size of the matrix
figure,imshow(image_4_bilinear_anti_false_UP);
title('Upsamled image from scale 1/4, bilirear, aliasing');

image_4_bilinear_anti_UP = imresize(image_down4_anti,[N,M],'bilinear','Antialiasing',true);
size(image_4_bilinear_anti_UP) % the size of the matrix
figure,imshow(image_4_bilinear_anti_UP);
title('Upsamled image from scale 1/4, bilenear, antialiasing');
%----------------------------------------
image_4_bicubic_anti_false_UP = imresize(image_down4_anti_false,[N,M],'bicubic','Antialiasing',false);
size(image_4_bicubic_anti_false_UP) % the size of the matrix
figure,imshow(image_4_bicubic_anti_false_UP);
title('Upsamled image, scale 1/4, bicubic, aliasing');

image_4_bicubic_anti_UP = imresize(image_down4_anti,[N,M],'bicubic','Antialiasing',true);
size(image_4_bicubic_anti_UP) % the size of the matrix
figure,imshow(image_4_bicubic_anti_UP);
title('Upsamled image from scale 1/4, bicubic, antialiasing');

%---------------   parameter 1/8  ----------------------------------------

image_8_nearest_anti_false_UP = imresize(image_down8_anti_false,8,'nearest','Antialiasing',false);  %parameter 8 instead of final size 
size(image_8_nearest_anti_false_UP) % the size of the matrix
figure,imshow(image_8_nearest_anti_false_UP);
title('Upsamled image from scale 1/8, nearest neighbor, aliasing');

image_8_nearest_anti_UP = imresize(image_down8_anti,8,'nearest','Antialiasing',true);
size(image_8_nearest_anti_UP) % the size of the matrix
figure,imshow(image_8_nearest_anti_UP);
title('Upsamled image from scale 1/8, nearest neighbor, antialiasing');

%------------------------------
image_8_bilinear_anti_false_UP = imresize(image_down8_anti_false,8,'bilinear','Antialiasing',false);
size(image_8_bilinear_anti_false_UP) % the size of the matrix
figure,imshow(image_8_bilinear_anti_false_UP);
title('Upsamled image from scale 1/8, bilinear, aliasing');

image_8_bilinear_anti_UP = imresize(image_down8_anti,8,'bilinear','Antialiasing',true);
size(image_8_bilinear_anti_UP) % the size of the matrix
figure,imshow(image_8_bilinear_anti_UP);
title('Upsamled image from scale 1/8, bilenear, antialiasing');
%----------------------------------------
image_8_bicubic_anti_false_UP = imresize(image_down8_anti_false,8,'bicubic','Antialiasing',false);
size(image_8_bicubic_anti_false_UP) % the size of the matrix
figure,imshow(image_8_bicubic_anti_false_UP);
title('Upsamled image from scale 1/8, bicubic, aliasing');

image_8_bicubic_anti_UP = imresize(image_down8_anti,8,'bicubic','Antialiasing',true);
size(image_8_bicubic_anti_UP) % the size of the matrix
figure,imshow(image_8_bicubic_anti_UP);
title('Upsamled image from scale 1/8, bicubic, antialiasing');

%----    MSE, comparison between original and sampled images

%immse(image,image_2_nearest_al_UP)
%immse(image,image_2_nearest_anti_UP)

%immse(image, image_2_bilinear_anti_false_UP)
%immse(image, image_2_bilinear_anti_UP)


mse_2_nearest_anti_false    = MSE(image,image_2_nearest_anti_false_UP);  %default value
mse_2_nearest_anti          = MSE(image,image_2_nearest_anti_UP);
mse_2_bilinear_anti_false   = MSE(image,image_2_bilinear_anti_false_UP);
mse_2_bilinear_anti         = MSE(image,image_2_bilinear_anti_UP);
mse_2_bicubic_anti_false    = MSE(image,image_2_bicubic_anti_false_UP);
mse_2_bicubic_anti          = MSE(image,image_2_bicubic_anti_UP);

mse_4_nearest_anti_false    = MSE(image,image_4_nearest_anti_false_UP);
mse_4_nearest_anti          = MSE(image,image_4_nearest_anti_UP);
mse_4_bilinear_anti_false   = MSE(image,image_4_bilinear_anti_false_UP);
mse_4_bilinear_anti         = MSE(image,image_4_bilinear_anti_UP);
mse_4_bicubic_anti_false    = MSE(image,image_4_bicubic_anti_false_UP);
mse_4_bicubic_anti          = MSE(image,image_4_bicubic_anti_UP);

mse_8_nearest_anti_false    = MSE(image,image_8_nearest_anti_false_UP);
mse_8_nearest_anti          = MSE(image,image_8_nearest_anti_UP);
mse_8_bilinear_anti_false   = MSE(image,image_8_bilinear_anti_false_UP);
mse_8_bilinear_anti         = MSE(image,image_8_bilinear_anti_UP);
mse_8_bicubic_anti_false    = MSE(image,image_8_bicubic_anti_false_UP);
mse_8_bicubic_anti          = MSE(image,image_8_bicubic_anti_UP);


