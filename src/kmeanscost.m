function J = kmeanscost(X, C, Mu)
    % KMEANSCOST: Cost function (overall distance) used by K-means.
    %
    % INPUT
    %   X   Input data
    %   C   Cluster assignments (indices)
    %   Mu  Cluster centroids
    % 
    % OUTPUT
    %   J  Cost (distance) value
    %
    % See also: KMEANSPLOT, KMEANS, KMEANSINITC, KMEANSMOVEC, KMEANSASSIGN
    %
    narginchk(3, 3);
    nargoutchk(0, 1);

    [m, n] = size(X);
    K = size(Mu, 1);

    Jmu = zeros(K, 1);
    for ii = 1:K
        Jmu(ii) = sum(sqrdist(X(find(C == ii),:), Mu(ii,:)));
    end
    J = sum(Jmu);
