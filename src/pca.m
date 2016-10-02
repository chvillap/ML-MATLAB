% PCA: Principal component analysis (feature extraction) examples.
% 
% EXAMPLE 1
%   Feature extraction for ordinary data points
%
% EXAMPLE 2
%   Eigenfaces
%
% See also: PCAPROJECT, PCARECOVER
%

% ---------------------------------------------------------------------
% Example 1

load('../data/ex7data1.mat');

fprintf('Running Example 1...\n');

[m, n] = size(X);
[Xnorm, mu, sigma] = normfeat(X);

Cov = 1/m * Xnorm' * Xnorm;
[U, S, V] = svd(Cov);

figure;
plot(Xnorm(:,1), Xnorm(:,2), 'bo');

v1 = S(1,1)*U(:,1)';
v2 = S(2,2)*U(:,2)';

hold on;
plot([0, v1(1)], [0, v1(2)], '-k', 'LineWidth', 2);
plot([0, v2(1)], [0, v2(2)], '-k', 'LineWidth', 2);
hold off;

K = 1;
Z = pcaproject(Xnorm, U, K);
Xrec = pcarecover(Z, U, K);

hold on;
plot(Xrec(:,1), Xrec(:,2), 'ro');
for ii = 1:size(Xnorm, 1)
    plot([Xnorm(ii,1), Xrec(ii,1)], [Xnorm(ii,2), Xrec(ii,1)], '--k');
end
hold off;

fprintf('Finished.\n\n');

% ---------------------------------------------------------------------
% Example 2

fprintf('Running Example 2...\n');

load('../data/ex7faces.mat');

[m, n] = size(X);
[Xnorm, mu, sigma] = normfeat(X);

Cov = 1/m * X' * X;
[U, S, V] = svd(Cov);

K = 100;
Z = pcaproject(Xnorm, U, K);
Xrec = pcarecover(Z, U, K);

Isz = [32, 32];
In = [10, 10];
Inorm = zeros(Isz .* In);
Irec = zeros(Isz .* In);
Ieig = zeros(Isz .* In);

for ii = 1:In(1)
    for jj = 1:In(2)
        kk = jj + ii*Isz(2);

        Inorm(1+(ii-1)*Isz(1):ii*Isz(1), 1+(jj-1)*Isz(2):jj*Isz(2)) = ...
            reshape(Xnorm(kk,:), Isz(1), Isz(2));

        Irec(1+(ii-1)*Isz(1):ii*Isz(1), 1+(jj-1)*Isz(2):jj*Isz(2)) = ...
            reshape(Xrec(kk,:), Isz(1), Isz(2));

        Ieig(1+(ii-1)*Isz(1):ii*Isz(1), 1+(jj-1)*Isz(2):jj*Isz(2)) = ...
            reshape(U(:,kk), Isz(1), Isz(2));
    end
end

figure;
subplot(1, 2, 1);
imagesc(Inorm);
title('Original');

subplot(1, 2, 2);
imagesc(Irec);
title('Recovered');
colormap gray;

figure;
imagesc(Ieig);
title('Eigenvectors');
colormap gray;

fprintf('Finished.\n\n');
