function A_rec = haar_1d_synthesis(A_haar)

    % compute the lenght and allocate memory for A_haar
    len = length(A_haar);
    temp_vector = zeros(1,len);
    A_rec = zeros(size(A_haar));
    
    %Using the differences to reconstruct the initial signal
    for i = 1:len / 2
        temp_vector(2*i - 1) = A_haar(i) + A_haar(i + len / 2);
        temp_vector(2*i) = A_haar(i) - A_haar(i + len / 2);
    end
    
    % compute A_rec using the temp_vector
    for l=1:len
        A_rec(l) = temp_vector(l);
    end
    
end