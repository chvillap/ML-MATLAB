function [mu, sigma2] = estimategaussian(X)
    % ESTIMATEGAUSSIAN: Estimates the parameters of a Gaussian distribution.
    % 
    % INPUT
    %   X  Input data
    % 
    % OUTPUT
    %   mu      Estimated mean
    %   sigma2  Estimated variance
    %
    % See also: PLOTGAUSSIANFIT, MULTVARGAUSSIAN, ANOMALYDETECT
    %
    narginchk(1, 1);
    nargoutchk(0, 2);

    mu = mean(X);
    sigma2 = var(X, 1);
