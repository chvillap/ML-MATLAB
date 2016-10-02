% ONEVSALL: One-vs-all logistic regression (classification) examples.
% 
% EXAMPLE 1
%   Multi-class classification
%
% See also: ONEVSALLPRED, LOGREGCOST, GRADDESC
%

% ---------------------------------------------------------------------
% Example 1

fprintf('Running Example 1...\n');

load('../data/ex3data1.mat');
labels = max(y);

[m, n] = size(X);
Thetas = zeros(labels, n+1);
alpha = 1;
lambda = 0.1;
maxiter = 200;

for c = 1:labels
    fprintf('  Now training for y = %d.\n', c);

    yc = (y == c);
    theta = zeros(n+1, 1);

    [theta, J, iter] = graddesc(@logregcost, theta, [ones(m,1), X], ...
                                yc, alpha, lambda, maxiter);

    figure, plot(1:iter+1, J);
    title(['Example 1 (y = ', num2str(c), ')']);
    xlabel('Iterations');
    ylabel('Cost');

    % options = optimset('GradObj', 'on', 'MaxIter', 50);
    % theta = fmincg(@(t)(logregcost(t, [ones(m,1), X], yc, lambda)), ...
    %                theta, options);

    Thetas(c,:) = theta';
end

[yy, prob] = onevsallpred(Thetas, [ones(m,1), X]);
fprintf('Training Set Accuracy: %g%%\n\n', mean(double(yy == y))*100);
