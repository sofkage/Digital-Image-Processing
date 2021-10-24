clear all;
close all;
clc;


A = [88 88 89 90 92 94 96 97];

A_haar = haar_1d_analysis(A)
A_rec  = haar_1d_synthesis(A_haar)

if (A == A_rec)
        disp('Haar Wavelet Transform Succeeded !!!');
else 
     disp('Something went wrong...');
end