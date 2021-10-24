function median_image = compute_median(I, K)

[m k] = size(I);
[n l] = size(K);

median_image = I;
paddedI = padarray(I, [floor(n/2) floor(l/2)]);

for i = 1:m;
    for j = 1:k;
        vect = reshape(paddedI(i : i+n-1, j : j+l-1)',1,[]);
        median_vect = median(double(vect));
        median_image(i,j) = median_vect;
    end
end
figure,imshow(median_image)

end

