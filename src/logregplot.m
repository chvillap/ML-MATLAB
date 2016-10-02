function logregplot(X, y)
    % LOGREGPLOT: Plots labeled (classified) data points.
    %
    % INPUT
    %   X  Input data
    %   y  Target data
    %
    % See also: LOGREG, LOGREGPRED
    %
    figure;
    [m, n] = size(X);
  
    pos = find(y == 1);
    neg = find(y == 0);

    switch n
        case 1
            hold on;
            plot(X(pos), 'bo');
            plot(X(neg), 'rv');
            hold off;
            ylabel('x_{1}');
        case 2
            hold on;
            plot(X(pos,1), X(pos,2), 'bo');
            plot(X(neg,1), X(neg,2), 'rv');
            hold off;
            xlabel('x_{1}');
            ylabel('x_{2}');
        case 3
            hold on;
            plot3(X(pos,1), X(pos,2), X(pos,3), 'bo');
            plot3(X(neg,1), X(neg,2), X(neg,3), 'rv');
            hold off;
            xlabel('x_{1}');
            ylabel('x_{2}');
            zlabel('x_{3}');
        otherwise
            error('Data is impossible to plot.');
    end
    legend('Positive', 'Negative');
