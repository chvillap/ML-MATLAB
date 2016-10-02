function plotgaussianfit(X, mu, Sigma2)
    % PLOTGAUSSIANFIT: Plots data relative to a Gaussian distribution.
    %
    % INPUT
    %   X       Input data
    %   mu      Gaussian distribution's mean
    %   sigma2  Gaussian distribution's variance
    %
    % See also: ESTIMATEGAUSSIAN, MULTVARGAUSSIAN
    %
    narginchk(3, 3);
    nargoutchk(0, 0);

    [X1, X2] = meshgrid(min(X(:,1)):0.5:max(X(:,1)), ...
                        min(X(:,2)):0.5:max(X(:,2)));

    Y = multvargaussian([X1(:), X2(:)], mu, Sigma2);
    Y = reshape(Y, size(X1));

    figure, plot(X(:,1), X(:,2), 'bx');

    hold on;
    if sum(isinf(Y)) == 0
        contour(X1, X2, Y, 10.^(-21:3:0)');
    end
    hold off;
