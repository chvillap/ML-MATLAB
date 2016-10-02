function [Xcomb] = combfeat(X1, X2, degree)
    % COMBFEAT: Polynomial combination of features.
    % 
    % INPUT
    %   X1      Data for feature 1
    %   X2      Data for feature 2
    %   degree  Degree of the polynomium
    % 
    % OUTPUT
    %   Xcomb  Combined features (each column is a combination)
    %
    Xcomb = ones(size(X1));
    % for ii = 1:degree
    %     for jj = 0:ii
    for ii = 0:degree
        for jj = 0:degree
            Xcomb(:,end+1) = X1.^(ii-jj) .* X2.^jj;
        end
    end
