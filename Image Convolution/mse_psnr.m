
function mse_psnr= mse_psnr(image1, image2);

image1 = double(image1);
image2 = double(image2);

mse = sum((image1(:)-image2(:)).^2) / prod(size(image1))
psnr = 10*log10(255*255/mse)

end

