function [y, prob] = onevsallpred(Thetas, X)
    % ONEVSALLPRED: Logistic regression prediction for multiclass problems.
    %
    % INPUT
    %   Theta  Parameters of all models
    %   X      Input data
    % 
    % OUTPUT
    %   y     Predicted data
    %   prob  Probabilities associated to each prediction
    %
    % See also: ONEVSALL, LOGREGCOST, GRADDESC
    %
    [prob, y] = max(sigmoid(X * Thetas'), [], 2);
