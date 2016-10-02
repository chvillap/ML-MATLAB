function plotdecbound(theta, X, mapfeatfunc)
    % PLOTDECBOUND: Plots nonlinear decision boundaries.
    %
    % INPUT
    %   theta        Model parameters
    %   X            Input data
    %   mapfeatfunc  Feature mapping function
    %
    pts = 100;
    [m, n] = size(X);

    if ~exist('mapfeatfunc')
        switch n
            case 1
                mapfeatfunc = @(u) u;
            case 2
                mapfeatfunc = @(u,v) [u, v];
            case 3
                mapfeatfunc = @(u,v,w) [u, v, w];
        end
    end

    hold on;
    switch n
        case 1
            u = linspace(min(X), max(X), pts);
            h = zeros(1, pts);
            for ii = 1:pts
                h(ii) = [1, mapfeatfunc(u(ii))] * theta;
            end
            z = find(h == 0);
            line([u(z), u(z)], [min(X), max(X)]);
        case 2
            u = linspace(min(X(:,1)), max(X(:,1)), pts);
            v = linspace(min(X(:,2)), max(X(:,2)), pts);
            h = zeros(pts, pts);
            for ii = 1:pts
                for jj = 1:pts
                    h(ii, jj) = ...
                        [1, mapfeatfunc(u(ii), v(jj))] * theta;
                end
            end
            contour(u, v, h, [0, 0], 'k-');
        case 3
            u = linspace(min(X(:,1)), max(X(:,1)), pts);
            v = linspace(min(X(:,2)), max(X(:,2)), pts);
            w = linspace(min(X(:,3)), max(X(:,3)), pts);
            h = zeros(pts, pts, pts);
            for ii = 1:pts
                for jj = 1:pts
                    for kk = 1:pts
                        h(ii, jj, kk) = ...
                            [1, mapfeatfunc(u(ii), v(jj), w(kk))] * theta;
                    end
                end
            end
            isosurface(u, v, w, h, 0, 'FaceColor', 'none', 'EdgeColor', 'k');
        otherwise
            error('Decision boundary is impossible to plot.');
    end
    hold off;
