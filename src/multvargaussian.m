function p = multvargaussian(X, mu, Sigma2)
    % MULTVARGAUSSIAN: Computes probabilities in a multivariate Gaussian.
    % 
    % INPUT
    %   X       Input data
    %   mu      Mean vector
    %   Sigma2  Covariance matrix
    % 
    % OUTPUT
    %   p  Probabilities for each data point
    %
    % See also: PLOTGAUSSIANFIT, ESTIMATEGAUSSIAN, ANOMALYDETECT
    %
    narginchk(3, 3);
    nargoutchk(0, 1);

    [m, k] = size(X);

    if size(Sigma2, 1) == 1 || size(Sigma2, 2) == 1
        Sigma2 = diag(Sigma2);
    end

    Xmu = bsxfun(@minus, X, mu(:)');
    p = 1/sqrt((2*pi)^k * det(Sigma2)) * ...
        exp(-0.5 * sum(bsxfun(@times, Xmu*pinv(Sigma2), Xmu), 2));
