function linregplot(X, y, theta)
    % LINREGPLOT: Plots data points and their regression line/plane.
    %
    % INPUT
    %   X      Input data
    %   y      Target data
    %   theta  Linear model parameters
    %
    % See also: LINREG, LINREGNORMEQ, LINREGPRED
    %
    figure;
    [m, n] = size(X);
    
    switch n
        case 1
            plot(X, y, 'b+');
            if exist('theta')
                hold on;
                plot(X, [ones(m,1), X]*theta, 'r-');
                hold off;
                xlabel('x_{1}');
                ylabel('y');
            end
        case 2
            plot3(X(:,1), X(:,2), y, 'b+');
            if exist('theta')
                hold on;
                Px1 = [min(X(:,1)); max(X(:,1)); max(X(:,1)); min(X(:,1))];
                Px2 = [min(X(:,2)); min(X(:,2)); max(X(:,2)); max(X(:,2))];
                Py = linregpred(theta, [ones(4,1), Px1, Px2]);
                fill3(Px1, Px2, Py, 'y');
                hold off;
                xlabel('x_{1}');
                ylabel('x_{2}');
                zlabel('y');
            end
        otherwise
            error('Data is impossible to plot.');
    end
    legend('Data', 'Hypothesis');
