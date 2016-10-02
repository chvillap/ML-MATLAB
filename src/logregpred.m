function y = logregpred(theta, X)
    % LOGREGPRED: Logistic regression prediction for two-class problems.
    %
    % INPUT
    %   theta  Logistic model parameters
    %   X      Input data
    % 
    % OUTPUT
    %   y  Predicted data
    %
    % See also: LOGREG, LOGREGPLOT
    %
    y = X * theta >= 0;
    % y = sigmoid(X * theta) >= 0.5;
