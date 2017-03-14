function [J, grad] = contentbcost(weights, X, Y, R, lambda)
    % CONTENTBCOST: Cost function for the content-based recommendation algorithm.
    %
    % INPUT
    %   weights  Model parameters
    %   X        Features data
    %   Y        Ratings data
    %   R        Ratings mask
    %   lambda   Regularization trade-off parameter
    %
    % OUTPUT
    %   J     Cost value
    %   grad  Cost function's gradient vector
    %
    % See also: RECOMMENDSYS
    %
    [num_products, num_users] = size(Y);
    num_features = size(X, 2);

    Theta = reshape(weights, num_users, num_features);
    Thetagrad = zeros(size(Theta));

    J = 1/2 * sum(sum(R .* (X * Theta' - Y).^2)) + ...
        lambda/2 * sum(sum(Theta.^2));

    for jj = 1:num_users
        ri = find(R(:, jj) == 1);
        Thetagrad(jj, :) = ...
            (X(ri, :) * Theta(jj, :)' - Y(ri, jj))' * X(ri, :) + ...
            lambda * Theta(jj, :);
    end

    grad = Thetagrad(:);
