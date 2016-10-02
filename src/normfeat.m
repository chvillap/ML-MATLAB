function [Xnorm, mu, sigma] = normfeat(X)
    % NORMFEAT: Feature normalization (standard Gaussian).
    %
    % INPUT
    %   X  Input data
    % 
    % OUTPUT
    %   Xnorm  Normalized data
    %   mu     Estimated mean
    %   sigma  Estimated standard deviation
    %
    [m, n] = size(X);

    mu = mean(X);
    sigma = std(X);
    Xnorm = (X - repmat(mu, m, 1)) ./ repmat(sigma, m, 1);
