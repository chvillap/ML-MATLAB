function Mu = kmeansmovec(X, C, K)
    % KMEANSMOVEC: Update cluster centroids according to the last assignment.
    %
    % INPUT
    %   X  Input data
    %   C  Cluster assignments (indices)
    %   K  Number of clusters
    % 
    % OUTPUT
    %   J  Cost (distance) value
    %
    % See also: KMEANSPLOT, KMEANS, KMEANSINITC, KMEANSASSIGN, KMEANSCOST
    %
    narginchk(3, 3);
    nargoutchk(0, 1);

    for ii = 1:K
        Ci = find(C == ii);
        Mu(ii,:) = sum(X(Ci,:)) / length(Ci);
    end
