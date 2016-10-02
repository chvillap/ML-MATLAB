function y = linregpred(theta, X)
    % LINREGPRED: Linear regression prediction.
    %
    % INPUT
    %   theta  Linear model parameters
    %   X      Input data
    % 
    % OUTPUT
    %   y  Predicted data
    %
    % See also: LINREG, LINREGPLOT
    %
    y = X * theta;
