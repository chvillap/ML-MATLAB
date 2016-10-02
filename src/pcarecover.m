function Xrec = pcarecover(Z, U, K)
    % PCARECOVER: Projects data back to its original higher-dimensional space.
    %
    % INPUT
    %   Z  Projected data
    %   U  Projection basis
    %   K  Number of principal components
    % 
    % OUTPUT
    %   Xrec  Recovered data
    %
    % See also: PCA, PCAPROJECT
    %
    Xrec = Z * U(:,1:K)';
