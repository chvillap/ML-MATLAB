function [theta, J, iter] = graddesc(costfunc, theta, X, y, ...
                                     alpha, lambda, maxiter, epsilon)
    % GRADDESC: Batch gradient descent optimization.
    % 
    % INPUT
    %   costfunc  Cost function to optimize
    %   theta     Initial model parameters
    %   X         Input data
    %   y         Target data
    %   alpha     Learning rate
    %   lambda    Regularization trade-off parameter
    %   maxiter   Maximum number of iterations
    %   epsilon   Minimum cost difference to prevent early stopping
    % 
    % OUTPUT
    %   theta  Updated model parameters
    %   J      Cost value
    %   iter   Last iteration number
    %
    % See also: LINREG, LINREGCOST, LOGREG, LOGREGCOST
    %
    if ~exist('maxiter') || maxiter < 1
        maxiter = 10000;
    end
    if ~exist('epsilon') || epsilon <= 0
        epsilon = .00001;
    end

    iter = 1;
    [J(1), grad] = costfunc(theta, X, y, lambda);

    while true
        oldtheta = theta;

        theta = oldtheta - alpha*grad;
        [J(iter+1), grad] = costfunc(theta, X, y, lambda);

        if iter == maxiter || abs(J(iter+1) - J(iter)) < epsilon
            break;
        end
        iter = iter + 1;
    end
