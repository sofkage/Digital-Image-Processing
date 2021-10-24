function [ outputVector ] = haar_1d( inputVector)

% Temporary vector maintained to store the intermediate results
len = length(inputVector);
temp = zeros(1,len);

% Output vector after applying 1d haar wavelet
outputVector = zeros(size(inputVector));

    % Applying mean on pairs of values to get the first half of the
    % resultant vector and difference of pairs divided by square root of 2
    % to get the second half of the resultant matrix
    widthLimit = floor(len/2);
    for k = 0:widthLimit-1
        
        % Filling first half of the resulting vector
        temp(k+1) = (inputVector(2*k+1) + inputVector(2*k+2))/2;
        
        % Filling second half of the resulting vector
        temp(k+widthLimit+1) = (inputVector(2*k+1) - inputVector(2*k+2))/2;
        
    end
    
    % Filling the final resutant vector using the temporary vector
    for l=1:len
       
        outputVector(l) = temp(l);
        
    end

end