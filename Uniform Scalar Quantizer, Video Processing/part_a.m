clear all;
close all;
clc;

%--------------- PART A -------------------

A = 255;
I = imread('lena_gray_512.tif');

x = linspace(-A,A);

%--------  for vector as input signal
for R=0:8
    L = 2^R;
    Delta = (2*A)/L;
    quantized = uni_scalar(x,Delta);
    distortion(R+1) = immse(x,quantized)
    figure(),plot(quantized,x);
    title(sprintf('R=%d',R));
    axis([-A A -A A]);

end

R=0:8;
figure, plot(R,distortion);
title('D(R)');


%--------  for image as input signal

for R=2:9
    L = 2^R;
    Delta = (2*A)/L;
    quantized = uni_scalar(I,Delta);
    imdistortion(R-1) = immse(I,quantized)
    figure(),plot(quantized,I);
    axis tight;
    title(sprintf('R=%d',R));
end

R=2:9;
figure, plot(R,imdistortion);
title('D(R)');



