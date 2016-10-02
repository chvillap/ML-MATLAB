function Z = pcaproject(X, U, K)
    % PCAPROJECT: Projects data to a lower-dimensional space found with PCA.
    %
    % INPUT
    %   X  Input data
    %   U  Projection basis
    %   K  Number of principal components
    % 
    % OUTPUT
    %   Xrec  Projected data
    %
    % See also: PCA, PCARECOVER
    %
    Z = X * U(:,1:K);
