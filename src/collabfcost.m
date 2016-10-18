function [J, grad] = collabfcost(weights, Y, R, n, lambda)
    % COLLABFCOST: Cost function for the collaborative filtering algorithm.
    % 
    % INPUT
    %   weights  Model parameters
    %   Y        Ratings data
    %   R        Ratings mask
    %   n        Number of features
    %   lambda   Regularization trade-off parameter
    %
    % OUTPUT
    %   J     Cost value
    %   grad  Cost function's gradient vector
    %
    % See also: RECOMMENDSYS, NORMRATING
    %
    [num_products, num_users] = size(Y);
    num_features = n;

    X = reshape(weights(1:num_products*num_features), ...
                num_products, num_features);
    Theta = reshape(weights(num_products*num_features+1:end), ...
                    num_users, num_features);

    Xgrad = zeros(size(X));
    Thetagrad = zeros(size(Theta));

    J = 1/2 * sum(sum(R .* (X * Theta' - Y).^2)) + ...
        lambda/2 * sum(sum(Theta.^2)) + ...
        lambda/2 * sum(sum(X.^2));

    for ii = 1:num_products
        rj = find(R(ii, :) == 1);
        Xgrad(ii, :) = ...
            (X(ii, :) * Theta(rj, :)' - Y(ii, rj)) * Theta(rj, :) + ...
            lambda * X(ii, :);
    end

    for jj = 1:num_users
        ri = find(R(:, jj) == 1);
        Thetagrad(jj, :) = ...
            (X(ri, :) * Theta(jj, :)' - Y(ri, jj))' * X(ri, :) + ...
            lambda * Theta(jj, :);
    end

    grad = [Xgrad(:); Thetagrad(:)];
