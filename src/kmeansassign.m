function C = kmeansassign(X, Mu)
    % KMEANSASSIGN: Assigns data points to clusters.
    %
    % INPUT
    %   X   Input data
    %   Mu  Cluster centroids
    % 
    % OUTPUT
    %   C  Cluster assignments (indices)
    %
    % See also: KMEANSPLOT, KMEANS, KMEANSINITC, KMEANSMOVEC, KMEANSCOST
    %
    narginchk(2, 2);
    nargoutchk(0, 1);

    m = size(X, 1);
    K = size(Mu, 1);

    for ii = 1:m
        dists = sqrdist(Mu, X(ii,:));
        [dummy, C(ii)] = min(dists);
    end
