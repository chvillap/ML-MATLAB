function kmeansplot(X, C, Mu, OldMu)
    % KMEANSPLOT: Plots data points and their clusters.
    %
    % INPUT
    %   X      Input data
    %   C      Cluster assignments (indices)
    %   Mu     Cluster centroids
    %   OldMu  Previous cluster centroids (to plot the centroids' "path")
    %
    % See also: KMEANS, KMEANSINITC, KMEANSMOVEC, KMEANSASSIGN, KMEANSCOST
    %
    narginchk(3, 4);
    nargoutchk(0, 0);

    [m, n] = size(X);
    K = size(Mu, 1);

    hold on;
    
    palette = hsv(K + 1);
    colors = palette(C, :);

    switch n
        case 2
            scatter(X(:,1), X(:,2), 15, colors);
            plot(Mu(:,1), Mu(:,2), 'x', ...
                 'MarkerEdgeColor', 'k', ...
                 'MarkerSize', 10, ...
                 'LineWidth', 3);
        case 3
            scatter3(X(:,1), X(:,2), X(:,3), 15, colors);
            plot3(Mu(:,1), Mu(:,2), Mu(:,3), 'x', ...
                  'MarkerEdgeColor', 'k', ...
                  'MarkerSize', 10, ...
                  'LineWidth', 3);
        otherwise
            error('Data is impossible to plot.');
    end

    if exist('OldMu')
        for jj = 1:K
            p1 = OldMu(jj,:);
            p2 = Mu(jj,:);
            if n == 2
                plot([p1(1), p2(1)], [p1(2), p2(2)], 'k');
            elseif n == 3
                plot3([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'k');
            end
        end
    end
    
    hold off;
