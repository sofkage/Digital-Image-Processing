function MSE= MSE(image, image_new);
[N,M]=size(image);

image1 = double(image);
image2 = double(image_new);

s=0;
for i=1:N
    for j=1:N
        s = s+(image1(i,j) - image2(i,j))^2 ; 
    end
end
MSE=s/(M*N);

disp(MSE);
end
