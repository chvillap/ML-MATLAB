function g = sigmoidgrad(z)
    % SIGMOIDGRAD: Gradient of the sigmoid function.
    %
    % INPUT
    %   z  Any value or array
    % 
    % OUTPUT
    %   g  Sigmoid gradient value at z
    %
    % See also: SIGMOID
    %
    g = sigmoid(z) .* (1 - sigmoid(z));
