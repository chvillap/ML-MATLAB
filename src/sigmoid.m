function g = sigmoid(z)
    % SIGMOID: Sigmoid function.
    %
    % INPUT
    %   z  Any value or array
    % 
    % OUTPUT
    %   g  Sigmoid value at z
    %
    % See also: SIGMOIDGRAD
    %
    g = 1 ./ (1 + exp(-z));
