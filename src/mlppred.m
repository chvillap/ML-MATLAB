function [y, prob] = mlppred(Thetas, X)
    % MLPPRED: Multilayer perceptron prediction.
    %
    % INPUT
    %   Thetas  Flattened network weights
    %   X       Input data
    % 
    % OUTPUT
    %   y     Predicted data
    %   prob  Probabilities associated to each prediction
    %
    % See also: MLP
    %
    [m, n] = size(X);
    layers = size(Thetas, 1);
    labels = size(Thetas{end}, 1);
    
    A = cell(layers+1, 1);

    A{1} = X;
    for ii = 1:layers
        A{ii+1} = sigmoid([ones(m,1), A{ii}] * Thetas{ii}');
    end

    [prob, y] = max(A{end}, [], 2);
