function Xpoly = polyfeat(X, p)
    % POLYFEAT: Creates higher-polynomial variations of features.
    %
    % INPUT
    %   X  Input data
    %   p  Highest polynomial degree
    % 
    % OUTPUT
    %   Xpoly  Higher-polynomial features
    %
    Xpoly = repmat(X, 1, p) .^ repmat(1:p, length(X), 1);
