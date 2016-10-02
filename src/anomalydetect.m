% ANOMALYDETECT: Anomaly detection (outlier detection) examples.
% 
% EXAMPLE 1
%   Use of a Gaussian model and precision-recall evaluation.
%
% EXAMPLE 2
%   Use of a Gaussian model and precision-recall evaluation.
%
% See also: ESTIMATEGAUSSIAN, MULTVARGAUSSIAN, PLOTGAUSSIANFIT, PRECRECEVAL
%

% -----------------------------------------------------------------------------
% Example 1

fprintf('Running Example 1...\n');

load('../data/ex8data1.mat');

[mu, Sigma2] = estimategaussian(X);
p = multvargaussian(X, mu, Sigma2);

plotgaussianfit(X, mu, Sigma2);
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');

pval = multvargaussian(Xval, mu, Sigma2);

[thresh, F1] = precreceval(yval, pval);
fprintf('Best threshold found using cross-validation: %g\n', thresh);

outliers = find(p < thresh);

hold on
plot(X(outliers,1), X(outliers,2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off

fprintf('Finished.\n\n');

% ---------------------------------------------------------------------
% Example 2

fprintf('Running Example 2...\n');

load('../data/ex8data2.mat');

[mu, Sigma2] = estimategaussian(X);

p = multvargaussian(X, mu, Sigma2);

pval = multvargaussian(Xval, mu, Sigma2);
[thresh, F1] = precreceval(yval, pval);

fprintf('Best threshold found using cross-validation: %g\n', thresh);
fprintf('Best F1 on Cross Validation Set: %g\n', F1);
fprintf('Number of outliers found: %d\n', sum(p < thresh));

fprintf('Finished.\n\n');
