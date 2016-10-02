% KMEANS: K-means (clustering) examples.
% 
% EXAMPLE 1
%   Clustering of ordinary data points
%
% EXAMPLE 2
%   Clustering of pixels for image compression
%
% See also: KMEANSPLOT, KMEANSINITC, KMEANSMOVEC, KMEANSASSIGN, KMEANSCOST
%

% -----------------------------------------------------------------------------
% Example 1

fprintf('Running Example 1...\n');

load('../data/ex7data2.mat');

K = 3;
iterations = 10;

Mu = kmeansinitc(X, K);
C = kmeansassign(X, Mu);

figure;
kmeansplot(X, C, Mu);
pause;

for iter = 1:iterations
    OldMu = Mu;

    Mu = kmeansmovec(X, C, K);
    C = kmeansassign(X, Mu);
    J = kmeanscost(X, C, Mu);

    fprintf('Iteration %d: J = %g\n', iter, J);
    kmeansplot(X, C, Mu, OldMu);
    pause;

    if all(Mu == OldMu)
        break;
    end
end

fprintf('Finished in %d iterations.\n\n', iter);

% -----------------------------------------------------------------------------
% Example 2

fprintf('Running Example 2...\n');

K = 8;
iterations = 10;

Img = double(imread('../data/bird_small.png')) / 255;
X = reshape(Img, size(Img,1)*size(Img,2), 3);

Mu = kmeansinitc(X, K);
C = kmeansassign(X, Mu);

for iter = 1:iterations
    OldMu = Mu;

    Mu = kmeansmovec(X, C, K);
    C = kmeansassign(X, Mu);
    J = kmeanscost(X, C, Mu);

    fprintf('Iteration %d: J = %g\n', iter, J);

    if all(Mu == OldMu)
        break;
    end
end

fprintf('Finished in %d iterations.\n\n', iter);

figure;
kmeansplot(X, C, Mu);

Xrec = Mu(C,:);
Imgrec = reshape(Xrec, size(Img,1), size(Img,2), 3);

% Display the original image 
figure, subplot(1, 2, 1);
imagesc(Img); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(Imgrec)
title(sprintf('Compressed, with %d colors.', K));
