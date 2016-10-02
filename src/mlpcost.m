function [J, grad] = mlpcost(weights, lsizes, X, y, lambda)
    % MLPCOST: Regularized cost function used by MLP neural networks.
    %
    % INPUT
    %   weights  Network weights
    %   lsizes   Layer sizes (units)
    %   X        Input data
    %   y        Target data
    %   lambda   Regularization trade-off parameter
    % 
    % OUTPUT
    %   J     Cost value
    %   grad  Cost function's gradient vector
    %
    % See also: MLP, MLPRANDINITW, MLPPRED, SIGMOID, SIGMOIDGRAD
    %
    [m, n] = size(X);
    layers = length(lsizes);
    labels = lsizes(end);

    % ----------------------------
    % Step 0: Get parameters (Thetas)

    offset1 = 0;
    for l = 1:layers-1
        offset2 = offset1 + (lsizes(l)+1) * lsizes(l+1);
        Thetas{l} = reshape(weights(1+offset1:offset2), ...
                            lsizes(l+1), lsizes(l)+1);
        offset1 = offset2;
    end

    % ----------------------------
    % Step 1: Feed-forward (cost)

    A = cell(layers, 1);
    Z = cell(layers, 1);

    A{1} = X';
    for ii = 2:layers
        Z{ii} = Thetas{ii-1} * [ones(1,m); A{ii-1}];
        A{ii} = sigmoid(Z{ii});
    end

    J = 0;
    for c = 1:labels
        yc = (y == c);
        Ah = A{end}';
        J = J + sum(-yc.*log(Ah(:,c)) - (1-yc).*log(1 - Ah(:,c)));
    end
    J = J/m;

    regterm = 0;
    for l = 1:layers-1
        Thetasqr = Thetas{l}(:,2:end).^2;
        regterm = regterm + sum(Thetasqr(:));

        offset1 = offset2;
    end
    J = J + lambda/(2*m) * regterm;

    % ----------------------------
    % Step 2: Backpropagation

    Deltas = cell(layers, 1);
    Bigdeltas = cell(layers, 1);
    for l = 1:layers-1
        Bigdeltas{l} = zeros(lsizes(l+1), lsizes(l)+1);
    end

    for t = 1:m
        Deltas{layers} = zeros(lsizes(layers), 1);
        for c = 1:labels
            yc = (y == c);
            Deltas{layers}(c) = A{layers}(c,t) - yc(t);
        end
        for l = layers-1:-1:2
            Deltas{l} = Thetas{l}(:,2:end)' * Deltas{l+1} .* ...
                        sigmoidgrad(Z{l}(:,t));
        end
        for l = 1:layers-1
            Bigdeltas{l} = Bigdeltas{l} + Deltas{l+1} * [1; A{l}(:,t)]';
        end
    end

    % ----------------------------
    % Step 3: Gradients

    grad = [];

    for l = 1:layers-1
        Thetagrads{l} = 1/m * Bigdeltas{l} + ...
                        [zeros(lsizes(l+1), 1), lambda/m*Thetas{l}(:,2:end)];        
        grad = [grad; Thetagrads{l}(:)];
    end
