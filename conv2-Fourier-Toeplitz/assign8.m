clear all;
close all;
clc;

%step 1
I=imread("cameraman.tif");

%step 2
I_new = imresize(I,[30 30]);    

%step 3
I_fft2 = fft2(I_new);     
I_shifted = fftshift(I_fft2);

%step 4
figure,imagesc(I_new),colormap(gray);
figure,imagesc(abs(I_shifted)),colormap(gray);      

%step 5
N=9;
[X,Y] = meshgrid(ceil(-N/2):floor(N/2), ceil(-N/2):floor(N/2));
s = 0.8;
e = exp (-(X.^2 + Y.^2)/(2*s*s));
G = e/(2*pi*s*s);   

%step 6
G_fft2 = fft2(G);        
G_shifted = fftshift(G_fft2);
figure;

%step 7
G_mesh = mesh(abs(G_shifted)),colormap(gray);

%step 8
padded_image = padarray(I_new, [floor(N/2) floor(N/2)]);
filtered_im = conv2(padded_image,G,'valid') ;    
figure, imagesc(filtered_im),colormap(gray);

%step 9
PQ = size(I_new) + size(G) - 1;
PQ = 2 * ceil(PQ / 2);

I_f=fft2(I_new, PQ(1), PQ(2));
G_f=fft2(G, PQ(1), PQ(2));

prod = G_f.*I_f;

%step 10
prod_ifft=real(ifft2(prod))          
final_prod = imcrop(prod_ifft,[5 5 29 29]);
figure, imagesc(final_prod),colormap(gray);   

%step 11
M = length(I_new);
X = double(I_new);
T = convmtx2(G,M,M);
toep=reshape(T*X(:),size(G)+[30 30]-1);

toep = toep(5:end-4,5:end-4);
figure, imagesc(toep),colormap(gray);

%step 13
immse(filtered_im,final_prod)
immse(filtered_im,toep)
immse(final_prod,toep)
