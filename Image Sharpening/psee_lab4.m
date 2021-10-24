clear all;
close all;
clc;

K3=fspecial('average',[3 3]);
K5=fspecial('average',[5 5]);
K9=fspecial('average',[9 9]);

image1 = imread('noisyimg1.png');
figure,imshow(image1);
size(image1)
image2 = imread('noisyimg2.png');


% --------------  image1 -----------------------

median_image1_K3 = compute_median(image1,K3)
max_image1_K3 = compute_max(image1,K3)
min_image1_K3 = compute_min(image1,K3)

median_image1_K5 = compute_median(image1,K5)
max_image1_K5 = compute_max(image1,K5)
min_image1_K5 = compute_min(image1,K5)

median_image1_K9 = compute_median(image1,K9)
max_image1_K9 = compute_max(image1,K9)
min_image1_K9 = compute_min(image1,K9)

% --------------  image2 -----------------------

median_image2_K3 = compute_median(image2,K3)
max_image2_K3 = compute_max(image2,K3)
min_image2_K3 = compute_min(image2,K3)

median_image2_K5 = compute_median(image2,K5)
max_image2_K5 = compute_max(image2,K5)
min_image2_K5 = compute_min(image2,K5)

median_image2_K9 = compute_median(image2,K9)
max_image2_K9 = compute_max(image2,K9)
min_image2_K9 = compute_min(image2,K9)





