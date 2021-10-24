close all;
clear all;
clc;

%----------Gaussian Pyramid ------------------

H = fspecial('gaussian',[5 5],1);
image = imread('cameraman.tif');         %G0, N=5
conv1 = conv2(image,H,'same');

G1 = imresize(conv1, 1/2);
conv_2 = conv2(G1,H,'same');      %N=4,G1
figure,imshow(G1/255);

G2 = imresize(G1, 1/2);
conv_3 = conv2(G2,H,'same');       %N=3,G2
figure,imshow(G2/255);

G3 = imresize(G2, 1/2);
conv_4 = conv2(G3,H,'same');       %N=2,G3
figure,imshow(G3/255);

G4 = imresize(G3, 1/2);  %N=1,G4, smallest image, also N4
figure,imshow(G4/255);

% ----------- Laplacian Bases --------------------------------

L0 = double(image)-(imresize(G1,2));
L1 = G1-(imresize(G2,2));
L2 = G2-(imresize(G3,2));
L3 = G3-(imresize(G4,2));
L4 = G4;

figure,imshow(L0);
figure,imshow(L1);
figure,imshow(L2);
figure,imshow(L3);
figure,imshow(L4/255);


expand4 = imresize(L4,2);
recon4  = expand4 + L3;

expand3 = imresize(recon4,2);
recon3  = expand3 + L2;

expand2 = imresize(recon3,2);
recon2  = expand2 + L1;

expand1 = imresize(recon2,2);
recon1  = expand1 + L0;


immse(uint8(image),uint8(recon1))
