% MLP: Multilayer perceptron (neural network classification) examples.
% 
% EXAMPLE 1
%   Classification of digits using predefined weights
%
% EXAMPLE 2
%   Classification of digits using learned weights
%
% See also: MLPRANDINITW, MLPCOST, MLPPRED
%

% ---------------------------------------------------------------------
% Example 1

fprintf('Running Example 1...\n');

load('../data/ex4data1.mat');
load('../data/ex4weights.mat');

[m, n] = size(X);
Thetas = {Theta1; Theta2};

rp = randperm(m);
for ii = 1:20
    [yy, prob] = mlppred(Thetas, X(rp(ii),:));

    imshow(reshape(X(rp(ii),:), 20, 20), [-1, 1]);
    colormap gray;

    fprintf('  h(x) = %d (digit %d)\n', yy, mod(yy, 10));
    pause;
end

% ---------------------------------------------------------------------
% Example 2

fprintf('Running Example 2...\n');

load('../data/ex4data1.mat');

[m, n] = size(X);
lsizes = [400; 25; 10];
lambda = 1;

Thetas = {mlprandinitw(lsizes(1), lsizes(2)); ...
          mlprandinitw(lsizes(2), lsizes(3))};

weigths = [Thetas{1}(:); Thetas{2}(:)];
options = optimset('MaxIter', 50);

weigths = fmincg(@(w) mlpcost(w, lsizes, X, y, lambda), ...
                 weigths, options);

% weigths = graddesc(@(w,XX,yy,l) mlpcost(w, lsizes, XX, yy, l), ...
%                      weigths, X, y, 0.01, lambda);

offset = (lsizes(1) + 1) * lsizes(2);
Thetas = {reshape(weigths(1:offset), lsizes(2), lsizes(1)+1); ...
          reshape(weigths((offset+1):end), lsizes(3), lsizes(2)+1)};

[yy, prob] = mlppred(Thetas, X);

fprintf('Training Set Accuracy: %g%%\n\n', mean(double(yy == y))*100);
