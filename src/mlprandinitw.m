function W = mlprandinitw(Lin, Lout)
    % MLPRANDINITW: Random initialization of MLP layers' weights.
    %
    % INPUT
    %   Lin   Number of inputs
    %   Lout  Number of outputs
    % 
    % OUTPUT
    %   W  Random (Lout x Lin) weights
    %
    % See also: MLP, MLPCOST, MLPPRED
    %
    epsilon = 0.12;
    W = 2*epsilon*rand(Lout, 1+Lin) - epsilon;
