function [J, grad] = logregcost(theta, X, y, lambda)
    % LOGREGCOST: Regularized cost function used by logistic regression.
    %
    % INPUT
    %   theta   Linear model parameters
    %   X       Input data
    %   y       Target data
    %   lambda  Regularization trade-off parameter
    % 
    % OUTPUT
    %   J     Cost value
    %   grad  Cost function's gradient vector
    %
    % See also: LOGREG, SIGMOID, GRADDESC
    %
    [m, n] = size(X);

    h = sigmoid(X * theta);
    J = 1/m * sum(-y .* log(h) - (1-y) .* log(1-h)) + ...
        lambda/m * sum(theta(2:end).^2);

    temp = theta;
    temp(1) = 0;
    grad = 1/m * X'*(h-y) + lambda/m * temp;
