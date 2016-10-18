% RECOMMENDSYS: Recommender systems.
% 
% EXAMPLE 1
%   Collaborative filtering.
%
% EXAMPLE 2
%   Content based recommendation.
%
% See also: COLLABFCOST, CONTENTBCOST, NORMRATING
%

% -----------------------------------------------------------------------------
% Example 1

fprintf('Running Example 1...\n');

load('../data/ex8_movies.mat');

[num_movies, num_users] = size(Y);
movielist = getmovielist('../data/movie_ids.txt', num_movies);

imagesc(Y);
ylabel('Movies');
xlabel('Users');

y = zeros(num_movies, 1);
y(1) = 4;   % Toy Story (1995)
y(98) = 2;  % Silence of the Lambs (1991)
y(7) = 3;   % Twelve Monkeys (1995)
y(12) = 5;  % Usual Suspects, The (1995)
y(54) = 4;  % Outbreak (1995)
y(64) = 5;  % Shawshank Redemption, The (1994)
y(66) = 3;  % While You Were Sleeping (1995)
y(69) = 5;  % Forrest Gump (1994)
y(183) = 4; % Alien (1979)
y(226) = 5; % Die Hard 2 (1990)
y(355) = 5; % Sphere (1998)

Y = [y, Y];
R = [(y ~= 0), R];

fprintf('\nNew user ratings:\n');
for k = 1:num_movies
    if y(k) > 0 
        fprintf('  Rated %d for %s\n', y(k), movielist{k});
    end
end

[Ynorm, Ymu] = normrating(Y, R);

num_users = num_users + 1;
num_features = 10;

X = randn(num_movies, num_features);
Theta = randn(num_users, num_features);
weights = [X(:); Theta(:)];

lambda = 10;
options = optimset('GradObj', 'on', 'MaxIter', 100);
weights = fmincg(@(w)(collabfcost(w, Y, R, num_features, lambda)), ...
                 weights, options);

X = reshape(weights(1:num_movies*num_features), ...
            num_movies, num_features);
Theta = reshape(weights(num_movies*num_features+1:end), ...
                num_users, num_features);

Ypred = X * Theta' + repmat(Ymu, 1, num_users);
[_, pos] = sort(Ypred(:, 1), 'descend');

fprintf('\nTop 10 recommendations for you:\n');
for k = 1:10
    m = pos(k);
    fprintf('  %d. %s (score = %.2f)\n', k, movielist{m}, Ypred(m, 1));
end

fprintf('\nFinished.\n\n');


% -----------------------------------------------------------------------------
% Example 2

fprintf('Running Example 2...\n');

load('../data/ex8_movies.mat');
load('../data/ex8_movieParams.mat');

movielist = getmovielist('../data/movie_ids.txt', num_movies);

y = zeros(num_movies, 1);
y(1) = 4;   % Toy Story (1995)
y(98) = 2;  % Silence of the Lambs (1991)
y(7) = 3;   % Twelve Monkeys (1995)
y(12) = 5;  % Usual Suspects, The (1995)
y(54) = 4;  % Outbreak (1995)
y(64) = 5;  % Shawshank Redemption, The (1994)
y(66) = 3;  % While You Were Sleeping (1995)
y(69) = 5;  % Forrest Gump (1994)
y(183) = 4; % Alien (1979)
y(226) = 5; % Die Hard 2 (1990)
y(355) = 5; % Sphere (1998)

Y = [y, Y];
R = [(y ~= 0), R];

fprintf('\nNew user ratings:\n');
for k = 1:num_movies
    if y(k) > 0 
        fprintf('  Rated %d for %s\n', y(k), movielist{k});
    end
end

[Ynorm, Ymu] = normrating(Y, R);

num_movies = size(Y, 1);
num_users = size(Y, 2);
num_features = size(X, 2);

Theta = randn(num_users, num_features);
weights = Theta(:);

lambda = 10;
options = optimset('GradObj', 'on', 'MaxIter', 100);
weights = fmincg(@(w)(contentbcost(w, X, Y, R, lambda)), ...
                 weights, options);

Theta = reshape(weights, num_users, num_features);

Ypred = X * Theta' + repmat(Ymu, 1, num_users);
[_, pos] = sort(Ypred(:, 1), 'descend');

fprintf('\nTop 10 recommendations for you:\n');
for k = 1:10
    m = pos(k);
    fprintf('  %d. %s (score = %.2f)\n', k, movielist{m}, Ypred(m, 1));
end

fprintf('\nFinished.\n');
