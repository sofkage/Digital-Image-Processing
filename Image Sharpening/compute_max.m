function max_image = compute_max(I, K)

[m k] = size(I);
[n l] = size(K);

max_image = I;
paddedI = padarray(I, [floor(n/2) floor(l/2)]);

for i = 1:m;
    for j = 1:k;
        vectPaddedA = reshape(paddedI(i : i+n-1, j : j+l-1)',1,[]);
        medianOfVector = max(double(vectPaddedA));
        max_image(i,j) = medianOfVector;
    end
end
figure,imshow(max_image)

end
