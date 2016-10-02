% LOGREG: Logistic regression (classification) examples.
% 
% EXAMPLE 1
%   Binary classification of linearly separable data
%
% EXAMPLE 2
%   Binary classification of non-linearly separable data (polynomial features)
%
% See also: LOGREGPLOT, LOGREGPRED, LOGREGCOST, COMBFEAT, PLOTDECBOUND
%

% -----------------------------------------------------------------------------
% Example 1

fprintf('Running Example 1...\n');

data = load('../data/ex2data1.txt');
X = data(:, 1:end-1);
y = data(:, end);

[Xnorm, mu, sigma] = normfeat(X);

[m, n] = size(X);
theta = zeros(n+1, 1);
alpha = 1;
lambda = 0;

[theta, J, iter] = ...
    graddesc(@logregcost, theta, [ones(m,1), Xnorm], y, alpha, lambda);

logregplot(Xnorm, y);
plotdecbound(theta, Xnorm);
title('Example 1');

figure, plot(1:iter+1, J);
title('Example 1');
xlabel('Iterations');
ylabel('Cost');

fprintf('Finished in %d iterations.\n', iter);

xx = [-1, -1];
yy = logregpred(theta, [1, xx]);
fprintf('h([%g,%g]) = %g\n', xx(1), xx(2), yy);

xx = [1, 1];
yy = logregpred(theta, [1, xx]);
fprintf('h([%g,%g]) = %g\n\n', xx(1), xx(2), yy);

% -----------------------------------------------------------------------------
% Example 2

fprintf('Running Example 2...\n');

data = load('../data/ex2data2.txt');
X = data(:, 1:end-1);
y = data(:, end);

degree = 6;
Xcomb = combfeat(X(:,1), X(:,2), degree);

[m, n] = size(Xcomb);
theta = zeros(n+1, 1);
alpha = 1;
lambda = 1;

[theta, J, iter] = ...
    graddesc(@logregcost, theta, [ones(m,1), Xcomb], y, alpha, lambda);

logregplot(X, y);
plotdecbound(theta, X, @(X1, X2)(combfeat(X1, X2, degree)));
title('Example 2');

figure, plot(1:iter+1, J);
title('Example 2');
xlabel('Iterations');
ylabel('Cost');

fprintf('Finished in %d iterations.\n', iter);

xx = combfeat(1, 0, 6);
yy = logregpred(theta, [1, xx]);
fprintf('h([%g,%g]) = %g\n', xx(1), xx(2), yy);

xx = combfeat(0, 0, 6);
yy = logregpred(theta, [1, xx]);
fprintf('h([%g,%g]) = %g\n\n', xx(1), xx(2), yy);
