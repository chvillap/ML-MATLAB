function dist = sqrdist(X, p)
    % SQRDIST: Squared distance for multivariate data.
    %
    % INPUT
    %   X  Input data (each column is a variable)
    %   p  Vector of target points
    % 
    % OUTPUT
    %   dist  Squared distances
    %
    % See also: KMEANSCOST
    %
    narginchk(2, 2);
    nargoutchk(0, 1);

    m = size(X, 1);
    dist = sum((X - repmat(p, m, 1)).^2, 2);
