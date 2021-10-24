close all;
clear all;
clc;



J=[1 2 1; 2 4 2; 1 2 1];
k=(1/16).* J;


I=imread('lena_gray_512.tif');
figure,imshow(I), title('Original Image');

padded_image_zero = padarray(I, [floor(size(k,1)/2) floor(size(k,2)/2)]);
padded_image_replicate = padarray(I, [floor(size(k,1)/2) floor(size(k,2)/2)],'replicate');


%---------- 1 ---------------

[a,s]=size(padded_image_zero);

%imshow(padded_image);
%figure

I1 = convImage(padded_image_zero,k);
I2 =convImage(padded_image_replicate,k);
I1_crop = imcrop(I1,[3 3 511 511]);
I2_crop = imcrop(I2,[3 3 511 511]);
figure,imshow(I1_crop/255), title('Convolution with zero padding');
figure,imshow(I2_crop/255), title('Convolution with border replication');


%---------- 2 ---------------

I3 = conv2(padded_image_zero,k,'valid');  %zero padding, valid because we have 514x514
[p3,o3]=size(I3)
figure,imshow(I3/255), title('Convolution with function conv2 and zero padding');

I4 = conv2(padded_image_replicate,k,'valid');  %zero padding
[p4,o4]=size(I4);
figure,imshow(I4/255), title('Convolution with function conv2 and border replication ');

%---------- 3 ---------------


I5 = imfilter(I,k,'same','conv');
figure,imshow(I5), title('Filtered Image with zero padding')
[p5,o5]=size(I5);

I6 = imfilter(I,k,'replicate','same','conv');
figure, imshow(I6); 
title('Filtered Image with Border Replication')
[p6,o6]=size(I6);


mse_psnr(I,I1_crop);
mse_psnr(I,I2_crop);
mse_psnr(I,I3);
mse_psnr(I,I4);
mse_psnr(I,I5);
mse_psnr(I,I6);







