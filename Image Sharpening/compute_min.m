function min_image = compute_min(I, K)
[m k] = size(I);
[n l] = size(K);

min_image = I;
paddedI = padarray(I, [floor(n/2) floor(l/2)]);

for i = 1:m;
    for j = 1:k;
        vectPaddedA = reshape(paddedI(i : i+n-1, j : j+l-1)',1,[]);
        medianOfVector = min(double(vectPaddedA));
        min_image(i,j) = medianOfVector;
    end
end
figure,imshow(min_image)

end