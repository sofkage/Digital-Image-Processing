function convImage  = convolution( image,kernel )
[m1,n1] = size(image);
[m2,n2] = size(kernel);

mn = [m1,n1] + 2*([m2,n2]-1);  %518

a0 = zeros(mn);
a0(m2:(end-m2+1),n2:(end-n2+1)) = image;

convImage = zeros(m2+m1-1,n1+n2-1); %516

for ii = 1:mn(1)-m2+1 %518-3+1 = 516
    for jj =  1:mn(2)-n2+1
        x = a0(ii:ii+m2-1,jj:jj+n2-1);
        convImage(ii,jj) = x(:)'*kernel(:);  %transpose
    end
end
end  

