clear all;
close all;
clc;

%--------------- PART C -----------------------------------

%extracting 50th frame
vd = VideoReader('xylophone3.mp4')
frame = read(vd,50);
framegray = rgb2gray(frame);


% ------------- HAAR TRANSFORM ------------------
framegray = (imresize(framegray,[256 256]));

[a,h,v,d] = haart2(framegray,2);

subplot(2,2,1)
imagesc(a)
colormap gray(255)
title('Approximation Coef. of Level 1')

subplot(2,2,2)
imagesc(h{1})
title('Horizontal Detail Coef. of Level 1')

subplot(2,2,3)
imagesc(v{1})
title('Vertical Detail Coef. of Level 1')

subplot(2,2,4)
imagesc(d{1})
title('Diagonal Detail Coef. of Level 1')


figure
subplot(2,2,1)
imagesc(a)
colormap gray(255)
title('Approximation Coef. of Level 2')

subplot(2,2,2)
imagesc(h{2})
title('Horizontal Detail Coef. of Level 2')

subplot(2,2,3)
imagesc(v{2})
title('Vertical Detail Coef. of Level 2')

subplot(2,2,4)
imagesc(d{2})
title('Diagonal Detail Coef. of Level 2')


%-------------------  R=4  -------------------
A=255;
R=4;
L = 2^R;
Delta = (2*A)/L;
sub_h1_R4 = uni_scalar(h{1},Delta);
sub_v1_R4 = uni_scalar(v{1},Delta);
sub_d1_R4 = uni_scalar(d{1},Delta);
sub_h2_R4 = uni_scalar(h{2},Delta);
sub_v2_R4 = uni_scalar(v{2},Delta);
sub_d2_R4 = uni_scalar(d{2},Delta);


e_h1_R4 = entropy(sub_h1_R4);
e_v1_R4 = entropy(sub_v1_R4);
e_d1_R4 = entropy(sub_d1_R4);
e_h2_R4 = entropy(sub_h2_R4);
e_v2_R4 = entropy(sub_v2_R4);
e_d2_R4 = entropy(sub_d2_R4);

e_total_R4 = e_h1_R4+e_v1_R4+e_d1_R4+e_h2_R4+e_v2_R4+e_d2_R4
 
 
 %-------------- Reconstruction ------------------------------
h_1 = {sub_h1_R4,sub_h2_R4};
v_1 = {sub_v1_R4,sub_v2_R4};
d_1 = {sub_d1_R4,sub_d2_R4};

Irec = ihaart2(a,h_1,v_1,d_1);
psnr_R4 = psnr(framegray,uint8(Irec))
mse_R4=immse(framegray,uint8(Irec))
figure,imagesc(Irec)
colormap(gray)
title('Reconstructed - Method 1');
%-------- R=3 ------------------
R=3;
L = 2^R;
Delta = (2*A)/L;
sub_h1_R3 = uni_scalar(h{1},Delta);
sub_v1_R3 = uni_scalar(v{1},Delta);
sub_d1_R3 = uni_scalar(d{1},Delta);


%-------- R=5 ------------------
R=5;
L = 2^R;
Delta = (2*A)/L;
sub_h2_R5 = uni_scalar(h{2},Delta);
sub_v2_R5 = uni_scalar(v{2},Delta);
sub_d2_R5 = uni_scalar(d{2},Delta);

 e_h1_R3 = entropy(sub_h1_R3);
 e_v1_R3 = entropy(sub_v1_R3);
 e_d1_R3 = entropy(sub_d1_R3);
 e_h2_R5 = entropy(sub_h2_R5);
 e_v2_R5 = entropy(sub_v2_R5);
 e_d2_R5 = entropy(sub_d2_R5);


 e_total_R3_R5 = e_h1_R3+e_v1_R3+e_d1_R3+e_h2_R5+e_v2_R5+e_d2_R5

 %-------------- Reconstruction ------------------------------

h_1 = {sub_h1_R3,sub_h2_R5};
v_1 = {sub_v1_R3,sub_v2_R5};
d_1 = {sub_d1_R3,sub_d2_R5};

Irec = ihaart2(a,h_1,v_1,d_1);
psnr_R3_R5 = psnr(framegray,uint8(Irec))
mse_R3_R5=immse(framegray,uint8(Irec))

figure,imagesc(Irec)
colormap(gray)
title('Reconstructed - Method 2');

