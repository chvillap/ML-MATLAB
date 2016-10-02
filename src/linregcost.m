function [J, grad] = linregcost(theta, X, y, lambda)
    % LINREGCOST: Regularized cost function used by linear regression.
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
    % See also: LINREG, GRADDESC
    %
    [m, n] = size(X);

    h = X * theta;
    J = 1/(2*m) * (h-y)'*(h-y) + lambda/(2*m)*sum(theta(2:end).^2);

    temp = theta;
    temp(1) = 0;
    grad = 1/m * X'*(h-y) + lambda/m * temp;
