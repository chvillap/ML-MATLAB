function Mu = kmeansinitc(X, K)
    % KMEANSINITC: Random initialization of cluster centroids.
    %
    % INPUT
    %   X  Input data
    %   K  Number of clusters
    % 
    % OUTPUT
    %   Mu  Cluster centroids
    %
    % See also: KMEANSPLOT, KMEANS, KMEANSMOVEC, KMEANSASSIGN, KMEANSCOST
    %
    narginchk(2, 2);
    nargoutchk(0, 1);

    randidx = randperm(size(X, 1));
    Mu = X(randidx(1:K), :);
