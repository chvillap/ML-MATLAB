function [Ynorm, Ymu] = normrating(Y, R)
    % NORMRATING: Normalizes ratings to zero mean.
    % 
    % INPUT
    %   Y  Ratings data
    %   R  Ratings mask
    %
    % OUTPUT
    %   Ynorm  Normalized ratings
    %   Ymu    Mean ratings by product
    %
    % See also: RECOMMENDSYS, COLLABFCOST
    %
    num_products = size(Y, 1);
    
    Ynorm = zeros(size(Y));
    Ymu = zeros(num_products, 1);

    for ii = 1:num_products
        rj = find(R(ii, :) == 1);
        Ymu(ii) = mean(Y(ii, rj));
        Ynorm(ii, rj) = Y(ii, rj) - Ymu(ii);
    end
