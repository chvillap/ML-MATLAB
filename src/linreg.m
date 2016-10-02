% LINREG: Linear regression examples.
% 
% EXAMPLE 1
%   Simple linear regression (single explanatory variable X)
%
% EXAMPLE 2
%   Multiple linear regression (multiple explanatory variable X)
%
% See also: LINREGPLOT, LINREGPRED, LINREGNORMEQ, LINREGCOST
%

% -----------------------------------------------------------------------------
% Example 1

fprintf('Running Example 1...\n');

data = load('../data/ex1data1.txt');
X = data(:, 1:end-1);
y = data(:, end);

[m, n] = size(X);
theta = zeros(n+1, 1);
alpha = 0.01;
lambda = 0;

[theta, J, iter] = ...
    graddesc(@linregcost, theta, [ones(m,1), X], y, alpha, lambda);

linregplot(X, y, theta);
title('Example 1');

figure, plot(1:iter+1, J);
title('Example 1');
xlabel('Iterations');
ylabel('Cost');

fprintf('Finished in %d iterations.\n', iter);

xx = 15;
yy = linregpred(theta, [1, xx]);
fprintf('h(%g) = %g\n\n', xx, yy);

% -----------------------------------------------------------------------------
% Example 2

fprintf('Running Example 2...\n');

data = load('../data/ex1data2.txt');
X = data(:, 1:end-1);
y = data(:, end);

[Xnorm, mu, sigma] = normfeat(X);

[m, n] = size(Xnorm);
theta = zeros(n+1, 1);
alpha = 0.01;
lambda = 0;

[theta, J, iter] = ...
    graddesc(@linregcost, theta, [ones(m,1), Xnorm], y, alpha, lambda);

linregplot(Xnorm, y, theta);
title('Example 2');

figure, plot(1:iter+1, J);
title('Example 2');
xlabel('Iterations');
ylabel('Cost');

fprintf('Finished in %d iterations.\n', iter);

xx = [0, 0];
yy = linregpred(theta, [1, xx]);
fprintf('h([%g,%g]) = %g\n\n', xx(1), xx(2), yy);
