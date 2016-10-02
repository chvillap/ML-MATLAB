function theta = linregnormeq(X, y)
    % LINREGNORMEQ: Finds optimal linear model parameters analitically.
    %
    % INPUT
    %   X  Input data
    %   y  Target data
    % 
    % OUTPUT
    %   theta  Linear model parameters
    %
    % See also: LINREG, LINREGPLOT
    %
    theta = inv(X' * X) * X' * y;
